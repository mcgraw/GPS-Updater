//
//  GPSTests.m
//  GPS-Updater
//
//  Created by David McGraw on 6/29/10.
//

#import <SenTestingKit/SenTestingKit.h>
#import <UIKit/UIKit.h>

#import "GPSData.h"

@interface GPSTests : SenTestCase {
	GPSData *gpsDataObject;
}

@end

@implementation GPSTests

#pragma mark -
#pragma mark Test Setup / Teardown

- (void)setUp {
	NSLog(@"%@ setUp", self.name);
	gpsDataObject = [GPSData alloc];
	STAssertNotNil(gpsDataObject, @"Cannot create GPS Data instance");
}

- (void)tearDown {
	[gpsDataObject release];
	NSLog(@"%@ tearDown", self.name);
}

#pragma mark -
#pragma mark Core Tests

/* testGPSDataObject tests if the data object is created/initialized properly 
 * 1. Create GPSData object
 * 3. Check if Long, Lat, Alt are 0
 */
- (void)testGPSDataObject {
	NSLog(@"%@ start", self.name);
    STAssertEquals(gpsDataObject.data.longitude, 0.00f, @"Data object was not created properly");
    STAssertEquals(gpsDataObject.data.latitude, 0.00f, @"Data object was not created properly");
    STAssertEquals(gpsDataObject.data.altitude, 0.00f, @"Data object was not created properly");
	NSLog(@"%@ end", self.name);
}


@end
