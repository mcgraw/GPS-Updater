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

- (BOOL)initLocationObject {
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

- (BOOL)beginTrackingLocation {
    
    return NO;
}

- (BOOL)stopTrackingLocation {
    
    return NO;
}

#pragma mark -
#pragma mark Location Delegates

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)err {
    
    
}

#pragma mark -
#pragma mark Memory

- (void)dealloc {
	[super dealloc];
}

@end
