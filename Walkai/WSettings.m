//
//  WSettings.m
//  Walkai
//
//  Created by Mahesh_iOS on 04/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WSettings.h"

@implementation WSettings

#pragma mark - Class Methods

+ (instancetype)sessionSettings {
    static WSettings * sessionSettings = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sessionSettings = [[self alloc]init];
    });
    return sessionSettings;
}

#pragma mark - Properties

static NSString *const kUserId = @"legacySessionToken";
static NSString *const kPassword = @"password";
static NSString *const kEmail = @"email";
static NSString *const kFullName = @"fullName";

- (NSString*)userID {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kUserId];
}

- (NSString*)email {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kEmail];
}

- (NSString*)password {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kPassword];
}

- (NSString*)fullName {
    return [[NSUserDefaults standardUserDefaults] stringForKey:kFullName];
}

- (void)clearSession {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"" forKey:kFullName];
    [defaults setObject:@"" forKey:kUserId];
    [defaults setObject:@"" forKey:kEmail];
    [defaults setObject:@"" forKey:kPassword];
    [defaults synchronize];
}

- (void)initUserID:(NSString*)userID withEmail:(NSString*)email withPassword:(NSString*)password withName:(NSString*)fName {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    if (userID != nil)
        [defaults setObject:userID forKey:kUserId];
    if (email != nil)
        [defaults setObject:email forKey:kEmail];
    if (password != nil)
        [defaults setObject:password forKey:kPassword];
    if (fName != nil)
        [defaults setObject:fName forKey:kFullName];
    
    [defaults synchronize];
}

- (BOOL)isUserLoggedIn {
    if ([self.userID length] > 0)
        return YES;
    return NO;
}

@end
