//
//  GPSData.m
//  GPS-Updater
//
//  Created by David McGraw on 6/28/10.
//

#import "GPSData.h"

@implementation GPSData

@synthesize data;

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
    return YES;
}

- (BOOL)isLocationServicesEnabled {
    if(locationManager.locationServicesEnabled == NO) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"locationServicesDisabled" object:Nil];
        return NO;
    }
    else {
        locationManager.delegate = self;
    }
    return YES;
}

- (void)startUpdatingLocation {
    [locationManager startUpdatingLocation];
}

- (void)stopUpdatingLocation:(NSString *)state {
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
    NSLog(@"Location Manager Update:\n\t\tLatitude is %.02f\n\t\tLongitude is %.02f\n\t\tAltitude is %.02f", data.latitude, data.longitude, data.altitude);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)err {
    NSLog(@"Location Manager Error: %@", [err description]);
    if ([err code] != kCLErrorLocationUnknown) {
        NSString *t = [[NSString alloc] initWithFormat:@"Location manager update error with code %@", [err code]];
        [self stopUpdatingLocation:t];
        [t release];
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
