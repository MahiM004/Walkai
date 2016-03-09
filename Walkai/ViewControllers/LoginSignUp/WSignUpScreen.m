//
//  WSignUpScreen.m
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WSignUpScreen.h"

@interface WSignUpScreen ()
@property (weak, nonatomic) IBOutlet UIButton *studentBtn;
@property (weak, nonatomic) IBOutlet UIButton *professBtn;

@end

@implementation WSignUpScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)studentBtnAction:(UIButton*)sender {
    [self setupUI:sender];

}

-(IBAction)professionalBtnAction:(UIButton*)sender {
    [self setupUI:sender];
}

-(IBAction)dismissVC:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)setupUI:(UIButton*)sender {
    if (sender.tag == 11) {
        self.view.backgroundColor = colorW;
        _studentBtn.backgroundColor = [UIColor whiteColor];
        [_studentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_studentBtn setBackgroundColor:[UIColor whiteColor]];
        [_professBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_professBtn setBackgroundColor:[UIColor whiteColor]];
    }
    else {
        self.view.backgroundColor = [UIColor whiteColor];
        _professBtn.backgroundColor = colorW;
        [_professBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_professBtn setBackgroundColor:[UIColor whiteColor]];
        [_studentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_studentBtn setBackgroundColor:colorW];
    }
    
}

@end
