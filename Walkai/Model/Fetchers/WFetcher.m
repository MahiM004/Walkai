//
//  WFetcher.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WFetcher.h"

@implementation WFetcher


+ (NSURL *)URLForQuery:(NSString *)query
{
    query = [NSString stringWithFormat:@"%@", query];
    query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return [NSURL URLWithString:query];
}

@end
