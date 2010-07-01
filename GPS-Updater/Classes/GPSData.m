//
//  GPSData.m
//  GPS-Updater
//
//  Created by David McGraw on 6/28/10.
//

#import "GPSData.h"

@implementation GPSData

@synthesize data;
@synthesize delegate;

#pragma mark -
#pragma mark Member Functions

- (void)initData {
    locationManager = Nil;
    data.latitude   = 0.00f;
    data.longitude  = 0.00f;
    data.altitude   = 0.00f;
}

- (BOOL)initLocationObject {
    [self initData];
    
    locationManager = [[CLLocationManager alloc] init];
    if(locationManager == Nil) {
        return NO;
    }
    
    if(![self isLocationServicesEnabled])
        return NO;
    
    [self startUpdatingLocation];
    return YES;
}

- (BOOL)isLocationServicesEnabled {
    if([locationManager locationServicesEnabled] == NO) {
        return NO;
    }
    else {
        locationManager.delegate = self;
        locationManager.desiredAccuracy = [[NSNumber numberWithDouble:kCLLocationAccuracyNearestTenMeters] doubleValue];
    }
    return YES;
}

- (void)startUpdatingLocation {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateStateLabel" object:@"Location Updating"];
    [locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateStateLabel" object:@"Location Not Being Updating"];
    [locationManager stopUpdatingLocation];
}

#pragma mark -
#pragma mark Location Delegates

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    data.latitude  = newLocation.coordinate.latitude;
    data.longitude = newLocation.coordinate.longitude;
    data.altitude  = newLocation.altitude;
    
    [delegate locationDataUpdated];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)err {
    NSLog(@"Location Manager Error: %@", [err description]);
    if ([err code] != kCLErrorLocationUnknown) {
        [self stopUpdatingLocation];
    }
    else {
        // kCLErrorLocationUnknown means the manager was unable to get the location
    }
}

#pragma mark -
#pragma mark Memory

- (void)dealloc {
	[super dealloc];
}

@end
