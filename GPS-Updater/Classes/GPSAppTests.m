//
//  GPSLogicTests.h
//  GPS-Updater
//
//  Created by David McGraw on 7/2/10.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

#define USE_APPLICATION_UNIT_TEST 0

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>
#import "GPSAppDelegate.h"
#import "GPSViewController.h"
#import "GPSData.h"
#import "StateManager.h"

@interface GPSAppTests : SenTestCase {
    GPSAppDelegate    *appDelegate;
    GPSViewController *viewController;
    UIView            *gpsView;
    
    GPSData           *gpsData;
}

#if USE_APPLICATION_UNIT_TEST
- (void) testAppDelegate;       // simple test on application
#else
- (void) testGPSObject;              // simple standalone test
#endif

@end


@implementation GPSAppTests

#if USE_APPLICATION_UNIT_TEST     
// all code under test is in the iPhone Application

- (void)setUp {
	appDelegate = [[UIApplication sharedApplication] delegate];
    viewController = appDelegate.viewController;
    gpsView = viewController.view;
}

- (void)testAppDelegate {
	STAssertNotNil(appDelegate, @"Application delegate not found");
}

#else                           
// all code under test must be linked into the Unit Test bundle

- (void) testGPSObject {
    gpsData = [GPSData alloc];
    [gpsData initData];
    STAssertEquals(gpsData.data.latitude, 0.00f, @"Latitude doesn't equal 0.00f");
    STAssertEquals(gpsData.data.longitude, 0.00f, @"Longitude doesn't equal 0.00f");
    STAssertEquals(gpsData.data.altitude, 0.00f, @"Altitude doesn't equal 0.00f");
}

#endif

/* Tag Reference
 2 - Status Label
 3 - Address Label
 
 5 - Longitude Label
 6 - Latitude Label
 7 - Altitude Label
 
 10 - Post Button
 11 - Map Button
 12 - Log Button
 13 - Settings Button
 */

@end
