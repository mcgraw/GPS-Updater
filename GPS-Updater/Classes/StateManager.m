//
//  StateManager.m
//  GPS-Updater
//
//  Created by David McGraw on 7/2/10.
//

#import "StateManager.h"


@implementation StateManager

@synthesize path;
@synthesize plistData;

- (BOOL)initStateManager {
    path = [[NSBundle mainBundle] pathForResource:kFilename ofType:@"plist"];
    if(!path)
        return NO;
    plistData = [NSDictionary dictionaryWithContentsOfFile:path];
    [plistData retain];
    return YES;
}


- (NSDictionary *)getStateAll {
    return plistData;
}

- (NSString *)getAddress {
    return [plistData valueForKey:kAddressKey];
}

- (NSString *)getUserId {
    return [NSString stringWithFormat:@"%@", [plistData objectForKey:kUserIdKey]];
}

- (void)saveAddress:(NSString *)value {
    NSMutableDictionary *temp = [plistData mutableCopy];
    [temp setValue:value forKey:kAddressKey];
    plistData = [temp copy];
    [temp release];
}

- (void)saveUserId:(NSString *)value {
   NSMutableDictionary *temp = [plistData mutableCopy];
   [temp setValue:value forKey:kUserIdKey]; 
   plistData = [temp copy];
   [temp release];
}

#pragma mark -
#pragma mark Memory
- (void)dealloc {
    [super dealloc];
    [plistData release];
}

@end
