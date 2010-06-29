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
    
    struct GPSLocation *data;
}

@property (nonatomic) struct GPSLocation *data;

- (BOOL)initLocationObject;

- (BOOL)isLocationServicesEnabled;

- (BOOL)beginTrackingLocation;

- (BOOL)stopTrackingLocation;

@end
