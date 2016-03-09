//
//  WViewUtility.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WViewUtility.h"

@implementation WViewUtility


+ (UIAlertView*)showAlert:(NSString *)title msg:(NSString *)messege {
    UIAlertView * aa = [[UIAlertView alloc]initWithTitle:title message:messege delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [aa show];
    return aa;
}


@end
