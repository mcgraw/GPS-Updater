//
//  StateManager.h
//  GPS-Updater
//
//  Created by David McGraw on 7/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kFilename       @"settings"
#define kAddressKey     @"WebAddress"
#define kUserIdKey      @"UserID"

@interface StateManager : NSObject {
    NSString *path;
    NSDictionary *plistData;
}

@property (readonly, retain) NSString *path;
@property (retain) NSDictionary *plistData;

- (BOOL)initStateManager;

- (NSDictionary *)getStateAll;

- (NSString *)getAddress;
- (NSString *)getUserId;
- (void)saveAddress:(NSString *)value;
- (void)saveUserId:(NSString *)value;

@end
