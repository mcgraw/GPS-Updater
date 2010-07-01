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

@protocol DataUpdated
- (void)locationDataUpdated;
@end

@interface GPSData : NSObject <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
    
    struct GPSLocation data;
    
    id<DataUpdated> delegate;
}

@property (readonly) struct GPSLocation data;
@property (retain) id<DataUpdated> delegate;

- (void)initData;

- (BOOL)initLocationObject;

- (BOOL)isLocationServicesEnabled;

- (void)startUpdatingLocation;

- (void)stopUpdatingLocation;

@end
