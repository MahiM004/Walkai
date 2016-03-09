//
//  WSignUpScreen.m
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WSignUpScreen.h"
#import "WUserFetcher.h"

#define VIEW_HEIGHT 630

@interface WSignUpScreen ()
{
    UIDatePicker *datePicker;
}

@property (weak, nonatomic) IBOutlet UIScrollView *parentScrollView;

//Buttons
@property (weak, nonatomic) IBOutlet UIButton *studentBtn;
@property (weak, nonatomic) IBOutlet UIButton *professBtn;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIButton *googleBtn;

//Heights
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *professHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *professHeight2;


//TextFields
@property (weak, nonatomic) IBOutlet UITextField *tfFName;
@property (weak, nonatomic) IBOutlet UITextField *tfLName;
@property (weak, nonatomic) IBOutlet UITextField *tfEmail;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UITextField *tfCompany;
@property (weak, nonatomic) IBOutlet UITextField *tfJobTitle;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfConfirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *tfZipCode;
@property (weak, nonatomic) IBOutlet UITextField *tfStudent;
@property (weak, nonatomic) IBOutlet UITextField *tfBMonth;
@property (weak, nonatomic) IBOutlet UITextField *tfBDay;
@property (weak, nonatomic) IBOutlet UITextField *tfBYear;




@end

@implementation WSignUpScreen

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //Default
    _professHeight.constant = 0;
    self.viewHeight.constant -= 135;
    _registerType = RegisterTypeStudent;
    
    _studentBtn.layer.borderColor = colorW.CGColor;
    _professBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    _registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [_registerBtn setBackgroundColor:colorW];
    
    _tfBMonth.text = @"12";
    _tfBYear.text = @"1992";
    _tfBDay.text = @"12";
    _tfStudent.text = @"No Study";
}

-(IBAction)studentBtnAction:(UIButton*)sender {
    [self setupUI:sender];
    _registerType = RegisterTypeStudent;
}

-(IBAction)professionalBtnAction:(UIButton*)sender {
    [self setupUI:sender];
    _registerType = RegisterTypeProfessional;
}

-(IBAction)registerAction:(id)sender {
    

    if (_tfFName.text.length == 0 || _tfLName.text.length == 0) {
        [WViewUtility showAlert:@"Failed" msg:@"Please check your First and Last name"];
        return;
    }
    if (_tfEmail.text.length == 0) {
        [WViewUtility showAlert:@"Failed" msg:@"Please check your Email"];
        return;
    }
    if (_tfConfirmPassword.text == _tfPassword.text) {
        [WViewUtility showAlert:@"Failed" msg:@"Please verify the passwords you given"];
        return;
    }
    if ( _tfPassword.text.length == 0 || _tfConfirmPassword.text.length == 0) {
        [WViewUtility showAlert:@"Failed" msg:@"Please verify the passwords you given"];
        return;
    }
    if (_tfZipCode.text.length == 0) {
        [WViewUtility showAlert:@"Failed" msg:@"Please check the ZipCode"];
        return;
    }
    
    if (_registerType == RegisterTypeProfessional) {
        if (_tfPhone.text.length == 0) {
            [WViewUtility showAlert:@"Failed" msg:@"Please check the Phone number"];
            return;
        }
        if (_tfCompany.text.length == 0) {
            [WViewUtility showAlert:@"Failed" msg:@"Please check the Company"];
            return;
        }
    }

    
    
    NSString * url = [NSString stringWithFormat:@"%@",[WUserFetcher URLforUserRegistration]];
    NSDictionary * addParams = (@{
                                  @"name":_tfFName.text,
                                  @"lastname":_tfLName.text,
                                  @"email":_tfEmail.text,
                                  @"password":_tfPassword.text,
                                  @"zipcode":_tfZipCode.text
                                  });
    NSMutableDictionary * params = [[NSMutableDictionary alloc]init];
    [params addEntriesFromDictionary:addParams];
    
    if (_registerType == RegisterTypeStudent) {
        [params setObject:_tfBMonth.text forKey:@"month"];
        [params setObject:_tfBYear.text forKey:@"year"];
        [params setObject:_tfBDay.text forKey:@"day"];
        [params setObject:_tfStudent.text forKey:@"school"];
        [params setObject:@"student" forKey:@"usertype"];
    }
    else {
        [params setObject:_tfPhone.text forKey:@"mobile"];
        [params setObject:_tfJobTitle.text forKey:@"jobtitle"];
        [params setObject:_tfCompany.text forKey:@"company"];
        [params setObject:@"professional" forKey:@"usertype"];
    }
    
    [WConnectionHelper postDataToURL:url withParameters:params contentType:kContentTypeJSON success:^(NSDictionary *response) {
        NSLog(@"%@",response);
    } failed:^(NSError *error) {
        [WViewUtility showAlert:@"Failed" msg:@"Something went wrong please try again"];
    }];
    
}

- (IBAction)openOptions:(UIButton*)sender {
    if (sender.tag == 39) {
        
    } else if (sender.tag == 40) {
        
    } else if (sender.tag == 41) {
        
    } else if (sender.tag == 42) {
        
    }
}

- (void)setupUI:(UIButton*)sender {
    
    [_parentScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    UILabel * signUpLbl = [self.view viewWithTag:35];
    UILabel * RegisterLbl = [self.view viewWithTag:36];
    UIButton * closeBtn = [self.view viewWithTag:37];
    UILabel * birthdayLbl = [self.view viewWithTag:38];
    UIView * proView = [self.view viewWithTag:43];
    if (sender.tag == 11) {
        self.view.backgroundColor = colorW;
        _studentBtn.backgroundColor = [UIColor whiteColor];
        [_studentBtn setTitleColor:colorW forState:UIControlStateNormal];
        [_studentBtn setBackgroundColor:[UIColor whiteColor]];
        [_professBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_professBtn setBackgroundColor:colorW];
        _professHeight.constant = 0;
        signUpLbl.textColor = [UIColor whiteColor];
        RegisterLbl.textColor = [UIColor whiteColor];
        birthdayLbl.textColor = [UIColor whiteColor];
        [closeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_professHeight2 setConstant:85];
        [proView setHidden:NO];
    }
    else if (sender.tag == 22){
        self.view.backgroundColor = [UIColor whiteColor];
        _professBtn.backgroundColor = colorW;
        [_professBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_professBtn setBackgroundColor:colorW];
        [_studentBtn setTitleColor:colorW forState:UIControlStateNormal];
        [_studentBtn setBackgroundColor:[UIColor whiteColor]];
        _professHeight.constant = 135;
        signUpLbl.textColor = colorW;
        RegisterLbl.textColor = [UIColor blackColor];
        birthdayLbl.textColor = [UIColor blackColor];
        [closeBtn setTitleColor:colorW forState:UIControlStateNormal];
        [_professHeight2 setConstant:0];
        [proView setHidden:YES];
    }
    [self updateHeightOfView:sender];
}

- (void)updateHeightOfView:(UIButton*)sender {
    CGFloat viewHe = VIEW_HEIGHT;
    if (sender.tag == 11)
        viewHe -= 135;

    if (_professHeight2.constant == 0)
        viewHe -= 85;
    
    _viewHeight.constant = viewHe;
    
    [self.view layoutIfNeeded];
}

-(IBAction)dismissVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end















