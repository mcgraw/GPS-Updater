//
//  SettingsViewController.m
//  GPS-Updater
//
//  Created by David McGraw on 6/30/10.
//

#import "SettingsViewController.h"
#import "StateManager.h"

@implementation SettingsViewController

@synthesize delegate;
@synthesize stateSettings;
@synthesize address;
@synthesize userid;

#pragma mark -
#pragma mark IBAction Methods

- (IBAction)closeView:(id)sender {
    if([self.delegate respondsToSelector:@selector(dismissSettingsModalView)])
       [self.delegate dismissSettingsModalView];
}


#pragma mark -
#pragma mark UI

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setState];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma mark -
#pragma mark TextField Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if(textField.tag == 0) {
        // Address Tag
        [stateSettings saveAddress:[textField text]];
    }
    else if(textField.tag == 1) {
        // UserID Tag
        [stateSettings saveUserId:[textField text]];
    }
    
    [self resignFirstResponder];
}

#pragma mark -
#pragma mark State
- (void)setState {
    address.text = [stateSettings getAddress];
    userid.text  = [stateSettings getUserId];
}

#pragma mark -
#pragma mark Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [super dealloc];
}


@end
