//
//  WViewUtility.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WViewUtility.h"

@implementation WViewUtility

+ (NSArray*)getProfileArray {
    NSArray * arr = @[(@{@"title":@"About Me",
                         @"icon":@"aboutMe"}),
                      (@{@"title":@"Work Objective",
                         @"icon":@"workObjective"}),
                      (@{@"title":@"Academic History",
                         @"icon":@"history"}),
                      (@{@"title":@"Work Experience",
                         @"icon":@"experience"}),
                      (@{@"title":@"Reference",
                         @"icon":@"reference"}),
                      (@{@"title":@"Additional Training",
                         @"icon":@"training"}),
                      (@{@"title":@"Leadership",
                         @"icon":@"leadership"}),
                      (@{@"title":@"Volunteer service",
                         @"icon":@"volunteer"}),
                      (@{@"title":@"Music/Artistic Achievements",
                         @"icon":@"musicArtist"}),
                      (@{@"title":@"Athletic Achivement",
                         @"icon":@"achievement"}),
                      (@{@"title":@"Extracurricular Activities",
                         @"icon":@"extracurricular"}),
                      (@{@"title":@"Additional Information",
                         @"icon":@"addinformation"}),
                      (@{@"title":@"Summary",
                         @"icon":@"summary"})];
    return arr;
}

+ (NSMutableArray*)getArrayOfNumbersWithLimit:(int)limit {
    NSMutableArray * objects = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= limit; i++)
         [objects addObject:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:i]]];
    
    return objects;
}

+ (NSMutableArray*)getYearArray {
    NSMutableArray * yearArr = [[NSMutableArray alloc]init];
    for (int i = 1960 ;i <= 2016 ;i++)
         [yearArr addObject:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:i]]];
    return yearArr;
}

+ (NSArray*)getMonthsArray {
    
    NSArray * monArr = @[@"Jan",@"Feb",@"Mar",@"Apr",@"May",@"Jun",@"Jul",@"Aug",@"Sep",@"Oct",@"Nov",@"Dec"];
    
    return monArr;
}

+ (NSArray*)getSchoolArrayForProfile {
    NSArray * schoolArray = @[@"School",@"Other",@"Bishop Blanchet",@"The Bush School",@"Eastside Catholic High School",@"Holy Names Academy",@"Lakeside School",@"O'Dea High School",@"Seattle Preparatory High School"];
    
    return schoolArray;
}

+ (NSArray*)getActivitiesTyepArray {
    
    NSArray * activities = @[@"Show All",@"Show Users",@"Show Groups",@"Show Discussion topics",@"Show Internships",@"Show Top-level Pages",@"Show Wire Posts",@"Show Academic history",@"Show work experience history"];
    
    return activities;
}

+ (UIAlertView*)showAlert:(NSString *)title msg:(NSString *)messege {
    UIAlertView * aa = [[UIAlertView alloc]initWithTitle:title message:messege delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [aa show];
    return aa;
}


@end
