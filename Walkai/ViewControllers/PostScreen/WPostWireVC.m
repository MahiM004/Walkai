//
//  WPostWireVC.m
//  Walkai
//
//  Created by Mahesh_iOS on 08/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WPostWireVC.h"
#import <IQKeyboardManager.h>
#import "WPostFetcher.h"

@interface WPostWireVC ()

@property (weak, nonatomic) IBOutlet UITextView *postTV;

@end

@implementation WPostWireVC

-(void)viewDidLoad {
    [super viewDidLoad];
    [[IQKeyboardManager sharedManager]disableToolbarInViewControllerClass:[WPostWireVC class]];
    [[IQKeyboardManager sharedManager]disableDistanceHandlingInViewControllerClass:[WPostWireVC class]];
    _postTV.layer.borderColor = colorW.CGColor;
    
    UIButton * crossBtn = [self.view viewWithTag:14];
    UIImage *iconCross = [UIImage imageWithIcon:@"fa-times" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(26, 26)];
    [crossBtn setImage:iconCross forState:UIControlStateNormal];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_postTV becomeFirstResponder];
    
}

- (IBAction)crossBtnAction:(id)sender {
    [_postTV resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)postWireBtnAction:(id)sender {
    [_postTV resignFirstResponder];
    NSString * url = [NSString stringWithFormat:@"%@",[WPostFetcher URLforPostToWire]];
    NSDictionary * params = (@{
                               @"userid":[[WSettings sessionSettings]userID],
                               @"postcontent":_postTV.text
                               });
    
    [WConnectionHelper postDataToURL:url withParameters:params contentType:kContentTypeJSON success:^(NSDictionary *response) {
        
        NSLog(@"%@",response);
        
        [_postTV resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
        
        
    } failed:^(NSError *error) {
        [WViewUtility showAlert:@"Failed" msg:@"Some thing went wrong please try again"];
        NSLog(@"%@",error);
    }];
}

#pragma mark TextView Delegates
- (void)textViewDidChange:(UITextView *)textView {
    UIButton * postBtn = [self.view viewWithTag:15];
    if (_postTV.text.length == 0) {
        postBtn.userInteractionEnabled = NO;
        [postBtn setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    } else {
        postBtn.userInteractionEnabled = YES;
        [postBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    //    CGFloat fixedWidth = textView.frame.size.width;
    //    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    //    CGRect newFrame = textView.frame;
    //    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    //    textView.frame = newFrame;
}



@end
