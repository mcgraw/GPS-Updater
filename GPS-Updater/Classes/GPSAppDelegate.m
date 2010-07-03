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

#pragma mark -
#pragma mark Application Goodness
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    GPSViewController *_gpsViewController = [[GPSViewController alloc] initWithNibName:@"GPSViewController" bundle:nil];
    _gpsViewController.view.frame = CGRectMake(0, 20, 320, 460);
    self.viewController = _gpsViewController;
    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    
	backgroundSupported = [self isBackgroundSupported];
		
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	NSLog(@"Entering Background");
	if(backgroundSupported)
		[self.viewController.gpsData stopUpdatingLocation];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	NSLog(@"Entering Foreground");
	[self.viewController.gpsData startUpdatingLocation];
}

- (BOOL)isBackgroundSupported {
	UIDevice *device = [UIDevice currentDevice];
	BOOL supported = NO;
	if([device respondsToSelector:@selector(isMultitaskingSupported)])
		return device.multitaskingSupported;
	return supported;
}

#pragma mark -
#pragma mark Memory
- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end

