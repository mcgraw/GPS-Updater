//
//  GPSViewController.m
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//

#import "GPSViewController.h"
#import "SettingsViewController.h"

@implementation GPSViewController

@synthesize longitude;
@synthesize latitude;
@synthesize altitude;
@synthesize alert;

#pragma mark -
#pragma mark IBAction Methods

- (IBAction)postNewLocation:(id)sender {
    NSLog(@"Post new location button pressed"); 
}

- (IBAction)showMapHistory:(id)sender {
    NSLog(@"Show map history button pressed"); 
}

- (IBAction)showLog:(id)sender {
    NSLog(@"Show log button pressed"); 
}

- (IBAction)showSettings:(id)sender {
    NSLog(@"Show settings button pressed");
    //SettingsViewController *settings = [SettingsViewController alloc];
    //[self presentModalViewController:settings animated:YES];
}

#pragma mark -
#pragma mark Notification

- (void)updateStateLabelNotify:(NSNotification *)notification {
    NSString *state = (NSString *)[notification object];
    self.alert.text = state;
    self.alert.textColor = [UIColor greenColor];
}

- (void)updateStateLabel:(NSString *)value color:(UIColor*)colorval {
    self.alert.text = value;
    self.alert.textColor = colorval;
}

#pragma mark -
#pragma mark UI

- (void)viewDidLoad {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateStateLabelNotify:) name:@"updateStateLabel" object:nil];
    
    if(![self createGPSObject]){
        [self updateStateLabel:@"Location Services Disabled?" color:[UIColor redColor]]; 
        return;
    }
    
    // Notify this class when GPS data has been updated
    gpsData.delegate = self;
}

- (void)viewDidUnload {

}

#pragma mark - 
#pragma mark Processes

- (BOOL)createGPSObject {
    gpsData = [[GPSData alloc] retain];
    if(gpsData == Nil)
        return NO;
    
    return [gpsData initLocationObject];
}

#pragma mark -
#pragma mark Delegates

- (void)locationDataUpdated {
    self.longitude.text = [NSString stringWithFormat:@"%.02f", gpsData.data.longitude];
    self.latitude.text = [NSString stringWithFormat:@"%.02f", gpsData.data.latitude];
    self.altitude.text = [NSString stringWithFormat:@"%.02f", gpsData.data.altitude];
}

#pragma mark -
#pragma mark Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
    [gpsData release];
}

@end
