//
//  GPSAppDelegate.h
//  GPS-Updater
//
//  Created by David McGraw on 6/27/10.
//


#import <UIKit/UIKit.h>

@class GPSViewController;

@interface GPSAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    GPSViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GPSViewController *viewController;

@end

