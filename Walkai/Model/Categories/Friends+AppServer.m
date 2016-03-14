//
//  Friends+AppServer.m
//  Walkai
//
//  Created by Mahesh_iOS on 14/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "Friends+AppServer.h"

@implementation Friends (AppServer)

+ (Friends*)friendWithAppServerInfo:(NSDictionary *)friendDictionary{
    
    Friends * friends = [[Friends alloc]init];
    
    friends = [self extrachFriendsFromJSONData:friendDictionary forFriends:friends];
    
    return friends;
}

+ (Friends *)extrachFriendsFromJSONData:(NSDictionary *)userDictionary forFriends:(Friends *)friends {
    
    if ([userDictionary valueForKey:@"avatar_url"] != [NSNull null] && [userDictionary valueForKey:@"avatar_url"])
        friends.avatar_url = [userDictionary valueForKey:@"avatar_url"];
    
    if ([userDictionary valueForKey:@"guid"] != [NSNull null] && [userDictionary valueForKey:@"guid"])
        friends.guid = [userDictionary valueForKey:@"guid"];
    
    if ([userDictionary valueForKey:@"name"] != [NSNull null] && [userDictionary valueForKey:@"name"])
        friends.name = [userDictionary valueForKey:@"name"];
    
    if ([userDictionary valueForKey:@"username"] != [NSNull null] && [userDictionary valueForKey:@"username"])
        friends.username = [userDictionary valueForKey:@"username"];
    
    return friends;
}

+ (NSMutableArray *)loadFriendsFromAppServerArray:(NSArray*)friends forFriendsArray:(NSMutableArray*)friendsArray {

    for (NSDictionary *friend in friends) {
        
        NSObject *someObject = [self friendWithAppServerInfo:friend];
        if (someObject)
            [friendsArray addObject:someObject];
        
    }
    return friendsArray;
}

@end
