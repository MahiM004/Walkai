//
//  WLaunchPageController.h
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLaunchContentPage : NSObject

@property (retain,nonatomic) NSString *titleText;
@property (retain,nonatomic) NSString *imageFile;
@property (retain,nonatomic) NSString *infoText;
@property (retain,nonatomic) NSString *logo;

- (id)initWithTitle:(NSString*)title image:(NSString*)image logo:(NSString*)logo;

@end

@interface WLaunchPageController : UIViewController

@property NSInteger pageIndex;
@property (retain, nonatomic) WLaunchContentPage * page;

@end
