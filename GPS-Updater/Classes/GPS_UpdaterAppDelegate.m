//
//  GPS_UpdaterAppDelegate.m
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//


#import "GPS_UpdaterAppDelegate.h"

#import "GPS_UpdaterViewController.h"

@implementation GPS_UpdaterAppDelegate


@synthesize window;

@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    // Override point for customization after app launch. 
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    [window release];
    [viewController release];
    [super dealloc];
}

@end

