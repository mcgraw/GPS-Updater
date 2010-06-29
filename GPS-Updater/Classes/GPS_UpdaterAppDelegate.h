//
//  GPS_UpdaterAppDelegate.h
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//


#import <UIKit/UIKit.h>

@class GPS_UpdaterViewController;

@interface GPS_UpdaterAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    GPS_UpdaterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet GPS_UpdaterViewController *viewController;

@end

