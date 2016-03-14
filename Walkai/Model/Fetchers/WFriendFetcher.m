//
//  WFriendFetcher.m
//  Walkai
//
//  Created by Mahesh_iOS on 14/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WFriendFetcher.h"

@implementation WFriendFetcher

+ (NSURL*)URLForGetFriendsList {
    return [self URLForQuery:[NSString stringWithFormat:@"%@/json/?method=user.friend.get_friends&api_key=%@&auth_token=%@",BASEURL,[[WSettings sessionSettings] apikey],[[WSettings sessionSettings] token]]];
}

@end
