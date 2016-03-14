//
//  User+AppServer.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "User+AppServer.h"

@implementation User (AppServer)

+ (User *)userWithAppServerInfo:(NSDictionary *)userDictionary forUser:(User *)user {
    
    user = [self extrachUserFromJSONData:userDictionary forUser:user];
    
    return user;
}

+ (User *)extrachUserFromJSONData:(NSDictionary *)userDictionary forUser:(User *)user {
    
    NSDictionary * resultDic = userDictionary[@"result"];
    
    if ([resultDic valueForKey:@"aboutme"] != [NSNull null])
        user.aboutMe = [resultDic valueForKey:@"aboutme"];
    
    if ([resultDic valueForKey:@"contact"] != [NSNull null])
        user.contact = [resultDic valueForKey:@"contact"];
    
    if ([resultDic valueForKey:@"deiscription"] != [NSNull null])
        user.descriptionTxt = [resultDic valueForKey:@"deiscription"];
    
    if ([resultDic valueForKey:@"email"] != [NSNull null])
        user.email = [resultDic valueForKey:@"email"];
    
    if ([resultDic valueForKey:@"image"] != [NSNull null])
        user.image = [resultDic valueForKey:@"image"];
    
    if ([resultDic valueForKey:@"interset"] != [NSNull null])
        user.interest = [resultDic valueForKey:@"interset"];
    
    if ([resultDic valueForKey:@"location"] != [NSNull null])
        user.location = [resultDic valueForKey:@"location"];
    
    if ([resultDic valueForKey:@"name"] != [NSNull null])
        user.name = [resultDic valueForKey:@"name"];
    
    if ([resultDic valueForKey:@"skills"] != [NSNull null])
        user.skills = [resultDic valueForKey:@"skills"];
    
    if ([resultDic valueForKey:@"telephone"] != [NSNull null])
        user.telephone = [resultDic valueForKey:@"telephone"];
    
    if ([resultDic valueForKey:@"twitter"] != [NSNull null])
        user.twitter = [resultDic valueForKey:@"twitter"];
    
    if ([resultDic valueForKey:@"website"] != [NSNull null])
        user.website = [resultDic valueForKey:@"website"];
    
    return user;
}

@end
