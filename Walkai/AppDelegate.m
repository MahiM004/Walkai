//
//  AppDelegate.m
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "AppDelegate.h"
#import "WLaunchScreen.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if ([[WSettings sessionSettings]isUserLoggedIn]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
        self.window.rootViewController = viewController;
        [self.window makeKeyAndVisible];
    }
    
    return YES;
}

- (void)backToInitialViewControllerFrom:(UIViewController *)viewController {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WLaunchScreen *initial = [mainStoryBoard instantiateViewControllerWithIdentifier:@"launchVC"];
    self.window.rootViewController = initial;
    for (UIView *subview in self.window.subviews) {
        if ([subview isKindOfClass:NSClassFromString(@"UITransitionView")]) {
            [subview removeFromSuperview];
        }
    }
    [viewController dismissViewControllerAnimated:NO completion:^{
        [viewController.view removeFromSuperview];
    }];
}




@end
