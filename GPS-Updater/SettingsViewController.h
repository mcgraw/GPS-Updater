//
//  SettingsViewController.h
//  GPS-Updater
//
//  Created by David McGraw on 6/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SettingsViewController : UIViewController {
    IBOutlet UITextField *address;
}

- (IBAction)closeView:(id)sender;

@end
