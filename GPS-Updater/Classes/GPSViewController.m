//
//  GPSViewController.m
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//

#import "GPSViewController.h"
#import "SettingsViewController.h"
#import "HTTPHandler.h"
#import "StateManager.h"

@implementation GPSViewController

@synthesize longitude;
@synthesize latitude;
@synthesize altitude;
@synthesize alert;
@synthesize address;
@synthesize gpsData;
@synthesize serviceEnabled;

#pragma mark -
#pragma mark IBAction Methods

- (IBAction)postNewLocation:(id)sender {
    NSLog(@"Post new location button pressed");
	if([stateSettings.plistData count] == 0 || serviceEnabled == NO) {
		[self updateStateLabel:@"Unable to post! Services disabled?" color:[UIColor redColor]];
		return;
	}
	
	NSDictionary *temp = [gpsData getPostDictionary:stateSettings.plistData];
	httpRequest = [HTTPHandler alloc];
	[httpRequest postLocation:temp site:address.text];
}

- (IBAction)showMapHistory:(id)sender {
    NSLog(@"Show map history button pressed"); 
}

- (IBAction)showLog:(id)sender {
    NSLog(@"Show log button pressed"); 
}

- (IBAction)showSettings:(id)sender {
    NSLog(@"Show settings button pressed");
    settings = [SettingsViewController alloc];
    settings.stateSettings = stateSettings;
    settings.delegate = self;
    [self presentModalViewController:settings animated:YES];
}

- (IBAction)infoMessage:(id)sender {
    [self showAlertWithString:@"GPS Updater"
					  content:@"Core Development\nDavid McGraw\ndlmcgraw07@gmail.com\n\nAdditional Development\n\tNobody\n\ngithub.com/mcgraw/GPS-Updater"];
}

#pragma mark -
#pragma mark UI

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateStateLabelNotify:) name:@"updateStateLabel" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showResponseString:) name:@"showResponseString" object:nil];
	
	// Get state settings (address, userid)
    if(![self initSavedState]){
        [self updateStateLabel:@"Saved data not found, check settings!" color:[UIColor redColor]];
    } else {
        // Set the View Label
        [self updateAddressLabel];
    }
	
    // Initialize GPS object
	self.serviceEnabled = [self createGPSObject];
    if(!self.serviceEnabled){
        [self updateStateLabel:@"Location Services Disabled?" color:[UIColor redColor]]; 
        return;
    }
	
	// Set the USER ID
	[self updateUserId];
	
    // Notify this class when GPS data has been updated
    gpsData.delegate = self;
}

- (void)viewDidUnload {

}

- (void)updateAddressLabel {
    self.address.text = [stateSettings getAddress];
}

- (void)updateUserId {
	[gpsData setUserId:[[stateSettings getUserId] intValue]];	
}

- (void)updateStateLabel:(NSString *)value color:(UIColor*)colorval {
    self.alert.text = value;
    self.alert.textColor = colorval;
}

- (void)showAlertWithString:(NSString *)titleMessage content:(NSString *)content {
	UIAlertView *alertM = [[UIAlertView alloc] initWithTitle:titleMessage
                                                     message:content
                                                    delegate: self
                                           cancelButtonTitle:@"Ok" 
                                           otherButtonTitles:Nil];
    [alertM show];
    [alertM release];
}

#pragma mark - 
#pragma mark Processes

- (BOOL)createGPSObject {
    gpsData = [[GPSData alloc] retain];
    if(gpsData == Nil)
        return NO;
    
    return [gpsData initLocationObject];
}

- (BOOL)initSavedState {
    stateSettings = [[StateManager alloc] retain];
    if(stateSettings == Nil)
        return NO;
    return [stateSettings initStateManager];
}


#pragma mark -
#pragma mark Delegates

- (void)locationDataUpdated {
    self.longitude.text = [NSString stringWithFormat:@"%.02f", gpsData.data.longitude];
    self.latitude.text = [NSString stringWithFormat:@"%.02f", gpsData.data.latitude];
    self.altitude.text = [NSString stringWithFormat:@"%.02f", gpsData.data.altitude];
}

// Update data from the Settings View
- (void)dismissSettingsModalView {
    stateSettings = settings.stateSettings;
    [self updateAddressLabel];
	[self updateUserId];
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Notification

- (void)updateStateLabelNotify:(NSNotification *)notification {
    NSString *state = (NSString *)[notification object];
    self.alert.text = state;
}

- (void)showResponseString:(NSNotification *)notification {
	NSString *response = (NSString *)[notification object];
	if(response != Nil)
		[self showAlertWithString:@"Response" content:response];
}

#pragma mark -
#pragma mark Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
    [gpsData release];
    [stateSettings release];
}

@end
