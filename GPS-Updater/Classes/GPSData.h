//
//  GPSData.h
//  GPS-Updater
//
//  Created by David McGraw on 6/28/10.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

struct GPSLocation {
    float longitude;
    float latitude;
    float altitude;
};

@interface GPSData : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    
    struct GPSLocation data;
}

@property (readonly) struct GPSLocation data;

- (void)initData;

- (BOOL)initLocationObject;

- (BOOL)isLocationServicesEnabled;

- (void)startUpdatingLocation;

- (void)stopUpdatingLocation:(NSString *)state;

@end
