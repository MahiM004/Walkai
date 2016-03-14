//
//  Friends+AppServer.h
//  Walkai
//
//  Created by Mahesh_iOS on 14/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "Friends.h"

@interface Friends (AppServer)

+ (Friends*)friendWithAppServerInfo:(NSDictionary*)friendDictionary;

+ (NSMutableArray *)loadFriendsFromAppServerArray:(NSArray*)friends forFriendsArray:(NSMutableArray*)friendsArray;

@end
