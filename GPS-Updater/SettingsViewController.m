//
//  SettingsViewController.m
//  GPS-Updater
//
//  Created by David McGraw on 6/30/10.
//

#import "SettingsViewController.h"


@implementation SettingsViewController

@synthesize delegate;
@synthesize address;
@synthesize userid;

#pragma mark -
#pragma mark IBAction Methods

- (IBAction)closeView:(id)sender {
    if([self.delegate respondsToSelector:@selector(dismissSettingsModalView)])
       [self.delegate dismissSettingsModalView];
}


#pragma mark -
#pragma mark UI

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSettingsFromPropertyList];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark -
#pragma mark State
- (void)loadSettingsFromPropertyList {

    NSString *path = [[NSBundle mainBundle] pathForResource:kFilename ofType:@"plist"];
    NSMutableDictionary *temp = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    self.address.text = [temp valueForKey:@"WebAddress"];
    self.userid.text  = [NSString stringWithFormat:@"%@", [temp objectForKey:@"UserID"]];
}

#pragma mark -
#pragma mark Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end
