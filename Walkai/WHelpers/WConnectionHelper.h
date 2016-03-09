//
//  WConnectionHelper.h
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString *const ContentType;
static ContentType kContentTypeJSON = @"application/json", kContentTypeHTMLOrText = @"text/html";

@interface WConnectionHelper : NSObject

+ (void)postDataToURL:(NSString *)url
       withParameters:(NSDictionary *)param
          contentType:(ContentType)contentType
              success:(void (^) (NSDictionary * response))success
               failed:(void (^) (NSError *error))failed;

+ (void)getDataFromURL:(NSString *)url
        withParameters:(NSDictionary *)param
           contentType:(ContentType)contentType
               success:(void (^) (NSDictionary * response))success
                failed:(void (^) (NSError *error))failed;


@end
