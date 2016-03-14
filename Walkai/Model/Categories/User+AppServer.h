//
//  User+AppServer.h
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "User.h"

@interface User (AppServer)

+ (User *)userWithAppServerInfo:(NSDictionary *)userDictionary forUser:(User *)user;
@end
