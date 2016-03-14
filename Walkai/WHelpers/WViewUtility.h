//
//  WViewUtility.h
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WViewUtility : NSObject

+ (NSArray*)getProfileArray;

+ (NSMutableArray*)getArrayOfNumbersWithLimit:(int)limit;

+ (NSArray*)getMonthsArray;

+ (NSMutableArray*)getYearArray;

+ (NSArray*)getSchoolArrayForProfile;

+ (NSArray*)getActivitiesTyepArray;

+ (UIAlertView*)showAlert:(NSString *)title msg:(NSString *)messege;
@end
