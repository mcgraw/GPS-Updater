//
//  GPSAppDelegate.m
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//


#import "GPSAppDelegate.h"
#import "GPSViewController.h"

@implementation GPSAppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {

    //[window release];
    //[viewController release];
    [super dealloc];
}

@end

