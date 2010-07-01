//
//  SettingsViewController.h
//  GPS-Updater
//
//  Created by David McGraw on 6/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kFilename       @"settings"

@protocol SettingsDelegate <NSObject>
- (void)dismissSettingsModalView;
@end

@interface SettingsViewController : UIViewController {
    IBOutlet UITextField *address;
    IBOutlet UITextField *userid;
    
    id <SettingsDelegate> delegate;
}

@property (retain) id <SettingsDelegate> delegate;
@property (retain) IBOutlet UITextField *address;
@property (retain) IBOutlet UITextField *userid;

- (IBAction)closeView:(id)sender;

- (void)loadSettingsFromPropertyList;

@end
