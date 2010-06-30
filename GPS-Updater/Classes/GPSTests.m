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

/* testInitLocationObject tests if the object was created properly
 * 
 */
- (void)testInitLocationObject {
	NSLog(@"%@ start", self.name);
	STAssertTrue([gpsDataObject initLocationObject], @"Instance Location not Initialized Properly");
	NSLog(@"%@ end", self.name);
}

/* testTrackingLocationOn tests if we are receiving updates when service is active
 * 
 */
- (void)testTrackingLocationOn {
	NSLog(@"%@ start", self.name);
	
    
	NSLog(@"%@ end", self.name);
}

/* testTrackingLocationOn tests if we are no longer getting service updates
 * 
 */
- (void)testTrackingLocationOff {
	NSLog(@"%@ start", self.name);
	
    
	NSLog(@"%@ end", self.name);
}

@end

/* Test Methods
 
		STAssertThrows
 
 */
