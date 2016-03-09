//
//  WSigninScreen.m
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WSigninScreen.h"
#import "WUserFetcher.h"
#import <QuartzCore/QuartzCore.h>

@interface WSigninScreen ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@end

@implementation WSigninScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameTF.layer.borderWidth = 1.0f;
    _userNameTF.layer.borderColor = colorW.CGColor;
    _passwordTF.layer.borderWidth = 1.0f;
    _passwordTF.layer.borderColor = colorW.CGColor;
    
    
}


- (IBAction)signBtnAction:(id)sender {
    
    NSString * urlString = [NSString stringWithFormat:@"%@",[WUserFetcher URLforUserAuthentication]];
    NSDictionary * params = (@{@"email":_userNameTF.text,
                               @"password":_passwordTF.text
                               });

    [WConnectionHelper postDataToURL:urlString withParameters:params contentType:kContentTypeJSON success:^(id response) {
        
        NSLog(@"%@",response);
        [self performSegueWithIdentifier:@"mainVC" sender:self];
    } failed:^(NSError *error) {
        
    }];
}
- (IBAction)tfEndEfiting:(id)sender {
    [self.view endEditing:YES];
}



-(IBAction)dismissVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
