//
//  WLaunchPageController.m
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WLaunchPageController.h"

#define kImageTopWithoutTitle 20
#define kImageTopWithTitle 80

@implementation WLaunchContentPage

-(id)initWithTitle:(NSString *)title image:(NSString *)image logo:(NSString*)logo {
    self = [super init];
    if (self) {
        _titleText = title;
        _imageFile = image;
        _logo = logo;
    }
    return self;
}

@end

@interface WLaunchPageController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *topImage;
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@end

@implementation WLaunchPageController

-(void)setPage:(WLaunchContentPage*)page{
    _page=page;
}

-(void)setupView{
    _lblTitle.text=@"";
    if (_page.titleText!=nil)
        _lblTitle.text=_page.titleText;
    
    _topImage.image=nil;
    if (_page.imageFile!=nil)
        _topImage.image=[UIImage imageNamed:_page.imageFile];
    
    _logoImage.image=nil;
    if (_page.logo!=nil)
        _logoImage.image=[UIImage imageNamed:_page.logo];
    
    UILabel * tit = [self.view viewWithTag:22];
    UILabel * subTit = [self.view viewWithTag:33];
    
    if (_pageIndex != 0) {
        [tit setHidden:YES];
        [subTit setHidden:YES];
        self.view.backgroundColor = [UIColor colorWithRed:67.0f/255.0f green:106.0f/255.0f blue:227.0f/255.0f alpha:1];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
        [tit setHidden:NO];
        [subTit setHidden:NO];
    }
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:_pageIndex] forKey:@"index"];

    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"pageChange" object:nil userInfo:dictionary];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupView];
    [self updateViewConstraints];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    if (IS_IPHONE_6 || IS_IPHONE_6P)
        _imageHeight.constant += 40;
    
    [self updateViewConstraints];
}


@end
