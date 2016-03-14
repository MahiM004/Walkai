//
//  WLaunchScreen.m
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WLaunchScreen.h"
#import "WLaunchPageController.h"

@interface WLaunchScreen () <UIPageViewControllerDataSource,UIPageViewControllerDelegate>

@property (retain, nonatomic) UIPageViewController *pageController;


@property (strong, nonatomic) NSArray * pages;

@property (weak, nonatomic) IBOutlet UIPageControl * pageControl;
@property (weak, nonatomic) IBOutlet UIButton *signUpBtn;
@property (weak, nonatomic) IBOutlet UIButton *signInBtn;
@property (weak, nonatomic) IBOutlet UIButton *abtBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pgControlBottomMargin;


@end

@implementation WLaunchScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pages=@[
             [[WLaunchContentPage alloc] initWithTitle:nil image:@"img_01" logo:@"logo_blue"],
             [[WLaunchContentPage alloc] initWithTitle:@"Create an Account" image:@"img_02" logo:nil],
             [[WLaunchContentPage alloc] initWithTitle:@"Build your Resume" image:@"img_03" logo:nil],
             [[WLaunchContentPage alloc] initWithTitle:@"Apply for Internships" image:@"img_04" logo:nil],
             ];
    
    _pageController=(UIPageViewController*)[self.childViewControllers lastObject];
    _pageController.delegate=self;
    _pageController.dataSource=self;
    
    WLaunchPageController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [_pageControl setNumberOfPages:[_pages count]];
    [_pageControl setCurrentPage:0];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pageChanged:) name:@"pageChange" object:nil];
    if (IS_IPHONE_4_OR_LESS)
        [_pgControlBottomMargin setConstant:-5];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
    if([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        
        [self.view layoutMargins];
    }
    
    [self.view layoutSubviews];
    [self updateViewConstraints];
    
    [_pageController.view layoutIfNeeded];
}


//WLaunchPageController method
- (WLaunchPageController *)viewControllerAtIndex:(NSUInteger)index {
    if (([_pages count] == 0) || (index >= [_pages count]))
        return nil;
    
    WLaunchPageController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WLaunchController"];
    pageContentViewController.pageIndex=index;
    
    [pageContentViewController setPage:[_pages objectAtIndex:index]];
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((WLaunchPageController*) viewController).pageIndex;
    
    if (index == NSNotFound)
        return nil;
    
    [_pageControl setCurrentPage:index];
    if (index == 0)
        return nil;
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((WLaunchPageController*) viewController).pageIndex;
    
    if (index == NSNotFound)
        return nil;
    
    [_pageControl setCurrentPage:index];
    
    index++;
    if (index == [_pages count])
        return nil;


    
    return [self viewControllerAtIndex:index];
}

//NSNotification Change UI with page change
- (void)pageChanged:(NSNotification*)notification {
    NSInteger pageIndex = [notification.userInfo[@"index"] integerValue];
    if (pageIndex == 0) {
        [UIView animateWithDuration:0.3 animations:^{
            [_signUpBtn setBackgroundColor:colorW];
            [_signUpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_signInBtn setBackgroundColor:colorW];
            [_signInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_abtBtn setTitleColor:colorW forState:UIControlStateNormal];
            self.view.backgroundColor = [UIColor whiteColor];
            _pageControl.currentPageIndicatorTintColor = colorW;
        }];
    }
    else if (pageIndex != 2) {
        [UIView animateWithDuration:0.3 animations:^{
            [_signUpBtn setBackgroundColor:[UIColor whiteColor]];
            [_signUpBtn setTitleColor:colorW forState:UIControlStateNormal];
            [_signInBtn setBackgroundColor:[UIColor whiteColor]];
            [_signInBtn setTitleColor:colorW forState:UIControlStateNormal];
            [_abtBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.view.backgroundColor = colorW;
            _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
        }];
    }
}


-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:@"pageChange"];
}

@end










