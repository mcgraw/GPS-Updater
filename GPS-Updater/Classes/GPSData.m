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
	data.userid     = 0;
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

- (NSDictionary *)getPostDictionary:(NSDictionary *)userDict {
	NSMutableDictionary *temp = [[NSMutableDictionary alloc] initWithDictionary:userDict];

	[temp setValue:[NSString stringWithFormat:@"%.02f", data.longitude] forKey:@"long"];
	[temp setValue:[NSString stringWithFormat:@"%.02f", data.latitude] forKey:@"lat"];
	[temp setValue:[NSString stringWithFormat:@"%.02f", data.altitude] forKey:@"alt"];
	[temp setValue:[NSString stringWithFormat:@"%d", data.userid] forKey:@"userid"];

	userDict = [temp copy];
	[temp release];
	return userDict;
}

- (void)setUserId:(int)value {
	data.userid = value;
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
