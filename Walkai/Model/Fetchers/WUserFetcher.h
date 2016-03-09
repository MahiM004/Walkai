//
//  WUserFetcher.h
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WFetcher.h"

@interface WUserFetcher : WFetcher

+ (NSURL *)URLforUserAuthentication;
+ (NSURL *)URLforUserRegistration;
+ (NSURL *)URLforGetUserProfile;


@end
