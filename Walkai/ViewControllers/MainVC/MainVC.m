//
//  MainVC.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "MainVC.h"


@interface MainVC ()

@property (weak, nonatomic) IBOutlet UIButton *menuBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *icon = [UIImage imageWithIcon:@"fa-bars" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(26, 26)];
    [_menuBtn setImage:icon forState:UIControlStateNormal];
    
    UIImage *rightIcon = [UIImage imageWithIcon:@"fa-ellipsis-v" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(26, 26)];
    [_rightBtn setImage:rightIcon forState:UIControlStateNormal];
    
    UIImage *searchIcon = [UIImage imageWithIcon:@"fa-search" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(20, 20)];
    [_searchBtn setImage:searchIcon forState:UIControlStateNormal];
}


@end
