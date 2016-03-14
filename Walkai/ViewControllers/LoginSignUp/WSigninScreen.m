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
    _userNameTF.text = @"maheshmasetti.ios@gmail.com";
    _passwordTF.text = @"mahi504";
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_userNameTF becomeFirstResponder];
}

- (IBAction)signBtnAction:(id)sender {
    if (_userNameTF.text.length == 0) {
        [WViewUtility showAlert:@"Failed" msg:@"Check your Email"];
        return;
    }
    
    if (_passwordTF.text.length == 0) {
        [WViewUtility showAlert:@"Failed" msg:@"Check your Password"];
        return;
    }
    
    [_passwordTF resignFirstResponder];
    
    NSString * urlString = [NSString stringWithFormat:@"%@",[WUserFetcher URLforUserAuthentication]];
    NSDictionary * params = (@{
                               @"email":_userNameTF.text,
                               @"password":_passwordTF.text
                               });

    [WConnectionHelper postDataToURL:urlString withParameters:params contentType:kContentTypeJSON success:^(NSDictionary * response) {
        
        NSDictionary * resultDic = [response valueForKey:@"result"];
        if ([[resultDic valueForKey:@"success"]boolValue]) {
            WSettings * settings = [WSettings sessionSettings];
            [settings initUserID:resultDic[@"userid"] withEmail:_userNameTF.text withPassword:_passwordTF.text withName:nil withResponse:resultDic];
            [self performSegueWithIdentifier:@"mainVC" sender:self];
        }
        else {
            NSLog(@"%@",response);
            WSettings * settings = [WSettings sessionSettings];
            [settings clearSession];
            [WViewUtility showAlert:@"Some thing wrong" msg:@"Please Try Again"];
        }
    } failed:^(NSError *error) {
        NSLog(@"%@",error);
        [WViewUtility showAlert:@"Some thing wrong" msg:@"Please Try Again"];
    }];
}

- (IBAction)tfEndEfiting:(id)sender {
    [self.view endEditing:YES];
}

-(IBAction)dismissVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
