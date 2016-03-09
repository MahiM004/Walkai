//
//  WUserFetcher.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WUserFetcher.h"

@implementation WUserFetcher


+ (NSURL *)URLforUserAuthentication {
    return [self URLForQuery:[NSString stringWithFormat:@"%@?method=login.user", BASEURL]];
}


+ (NSURL *)URLforUserRegistration {
    return [self URLForQuery:[NSString stringWithFormat:@"%@json/?method=register.user", BASEURL]];
}

+ (NSURL *)URLforGetUserProfile {
    return [self URLForQuery:[NSString stringWithFormat:@"%@json/?method=get.userdetails",BASEURL]];
}





@end
