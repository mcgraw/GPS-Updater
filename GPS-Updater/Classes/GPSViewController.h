//
//  GPSViewController.h
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//

#import <UIKit/UIKit.h>
#import "GPSData.h"

@interface GPSViewController : UIViewController <DataUpdated> {
    IBOutlet UILabel *longitude;
    IBOutlet UILabel *latitude;
    IBOutlet UILabel *altitude;
    IBOutlet UILabel *alert;

    GPSData *gpsData;
}

@property (retain) IBOutlet UILabel *longitude;
@property (retain) IBOutlet UILabel *latitude;
@property (retain) IBOutlet UILabel *altitude;
@property (retain) IBOutlet UILabel *alert;

// UI Handling
- (IBAction)postNewLocation:(id)sender;
- (IBAction)showMapHistory:(id)sender;
- (IBAction)showLog:(id)sender;
- (IBAction)showSettings:(id)sender;

// Data Handling
- (BOOL)createGPSObject;

@end

