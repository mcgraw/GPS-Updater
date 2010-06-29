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
    
    return NO;
}

- (BOOL)isLocationServicesEnabled {
    
    return NO;
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

@end
