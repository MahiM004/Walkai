//
//  WPostFetcher.m
//  Walkai
//
//  Created by Mahesh_iOS on 08/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WPostFetcher.h"

@implementation WPostFetcher

+ (NSURL *)URLforPostToWire {
    return [self URLForQuery:[NSString stringWithFormat:@"%@json/?method=wire.post",BASEURL]];
}

@end
