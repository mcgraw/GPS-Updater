//
//  GPSViewController.h
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//

#import <UIKit/UIKit.h>
#import "GPSData.h"
#import "SettingsViewController.h"

@class StateManager;
@class HTTPHandler;

@interface GPSViewController : UIViewController <DataUpdated, SettingsDelegate> {
    IBOutlet UILabel *longitude;
    IBOutlet UILabel *latitude;
    IBOutlet UILabel *altitude;
    IBOutlet UILabel *alert;
    IBOutlet UILabel *address;

    GPSData *gpsData;
    SettingsViewController *settings;
    StateManager *stateSettings;
	HTTPHandler *httpRequest;
	
	UIActivityIndicatorView *activity;
	
	BOOL serviceEnabled;
}

@property (retain) IBOutlet UILabel *longitude;
@property (retain) IBOutlet UILabel *latitude;
@property (retain) IBOutlet UILabel *altitude;
@property (retain) IBOutlet UILabel *alert;
@property (retain) IBOutlet UILabel *address;

@property (retain) GPSData *gpsData;
@property BOOL serviceEnabled;


// UI Handling
- (IBAction)postNewLocation:(id)sender;
- (IBAction)showMapHistory:(id)sender;
- (IBAction)showLog:(id)sender;
- (IBAction)showSettings:(id)sender;

- (IBAction)infoMessage:(id)sender;

- (void)updateAddressLabel;
- (void)updateStateLabel:(NSString *)value color:(UIColor*)colorval;

- (void)showAlertWithString:(NSString *)titleMessage content:(NSString *)content;

// Data Handling
- (void)updateUserId;
- (BOOL)createGPSObject;
- (BOOL)initSavedState;

@end

