//
//  HTTPHandler.m
//  GPS-Updater
//
//  Created by David McGraw on 7/3/10.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@interface HTTPHandler : NSObject {
    ASIFormDataRequest *request;
}

- (BOOL)postLocation:(NSDictionary *)data site:(NSString*)webAddress;

@end


@implementation HTTPHandler

- (BOOL)postLocation:(NSDictionary *)data site:(NSString*)webAddress {
	request = [[[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:webAddress]] autorelease];
	if(request == Nil)
		return NO;
	
	[data enumerateKeysAndObjectsUsingBlock:^(id key, id object, BOOL *stop) {
		[request addPostValue:object forKey:key];
	}];
	
	[request startSynchronous];
	NSError *error = [request error];
	if(!error) {
		NSLog(@"Response String: %@", [request responseString]);
		[[NSNotificationCenter defaultCenter] postNotificationName:@"showResponseString" object:[request responseString]];
		return YES;
	}
	
	NSLog(@"Response ERROR: %@", error);
	[[NSNotificationCenter defaultCenter] postNotificationName:@"updateStateLabel" object:@"Error Posting Location"];
    return NO;
}

@end
