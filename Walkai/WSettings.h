//
//  WSettings.h
//  Walkai
//
//  Created by Mahesh_iOS on 04/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSettings : NSObject

+ (instancetype)sessionSettings;

- (NSString *)email;
- (NSString *)password;
- (NSString *)fullName;
- (NSString *)userID;
- (NSString*)token;
- (NSString*)apikey;

- (void)clearSession;

- (void)initUserID:(NSString*)userID withEmail:(NSString*)email withPassword:(NSString*)password withName:(NSString*)fName withResponse:(NSDictionary*)response;

- (BOOL)isUserLoggedIn;

@end
