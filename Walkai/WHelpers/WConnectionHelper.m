//
//  WConnectionHelper.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WConnectionHelper.h"

@implementation WConnectionHelper

+ (void)postDataToURL:(NSString *)url withParameters:(NSDictionary *)param contentType:(ContentType)contentType success:(void (^)(id))success failed:(void (^)(NSError *))failed {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithObject:contentType];
    manager.responseSerializer = serializer;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [manager POST:url parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary * entitiesPropertyList = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
       if (success)
           success(entitiesPropertyList);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (failed)
            failed(error);
    }];
}

+ (void)getDataFromURL:(NSString *)url withParameters:(NSDictionary *)param contentType:(ContentType)contentType success:(void (^)(id))success failed:(void (^)(NSError *))failed {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    AFHTTPResponseSerializer *serializer = [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithObject:contentType];
    manager.responseSerializer = serializer;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [manager GET:url parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSDictionary *entitiesPropertyList = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
        if (success)
            success(entitiesPropertyList);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
       if (failed)
           failed(error);
    }];
}



@end
