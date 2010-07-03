//
//  SettingsViewController.h
//  GPS-Updater
//
//  Created by David McGraw on 6/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsDelegate <NSObject>
- (void)dismissSettingsModalView;
@end

@class StateManager;

@interface SettingsViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *address;
    IBOutlet UITextField *userid;
    
    id <SettingsDelegate> delegate;
    
    StateManager *stateSettings;
}

@property (retain) id <SettingsDelegate> delegate;
@property (retain) StateManager *stateSettings;
@property (retain) IBOutlet UITextField *address;
@property (retain) IBOutlet UITextField *userid;

- (IBAction)closeView:(id)sender;

- (void)setState;

@end
