//
//  WMainVC.m
//  Walkai
//
//  Created by Mahesh_iOS on 01/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WMainVC.h"
#import "WPostMessageCell.h"
#import "WUserFetcher.h"

#import "IQUIView+IQKeyboardToolbar.h"

@interface WMainVC () <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate> {
    BOOL isMenuOpen;
    NSInteger getSelectedTf;
    WPostMessageCell * postCell;
}
@property (strong, nonatomic) UIPickerView *pickerAge;
@property NSMutableArray * pickerArray;
@property (weak, nonatomic) IBOutlet UIButton *menuBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;


@end

@implementation WMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    isMenuOpen = NO;
    UIView * menuParentView = [self.view viewWithTag:11];
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideMenuView)];
    tap.numberOfTapsRequired = 1;
    [menuParentView addGestureRecognizer:tap];
    
    self.pickerArray = [[NSMutableArray alloc]init];
    self.pickerArray = [NSMutableArray arrayWithArray:[WViewUtility getActivitiesTyepArray]];
    //uipickerview for age
    self.pickerAge = [[UIPickerView alloc] init];
    self.pickerAge.showsSelectionIndicator = YES;
    self.pickerAge.delegate = self;
    self.pickerAge.dataSource = self;
    
    /*
     UIImage *icon = [UIImage imageWithIcon:@"fa-bars" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(26, 26)];
     [_menuBtn setImage:icon forState:UIControlStateNormal];
     
     UIImage *rightIcon = [UIImage imageWithIcon:@"fa-ellipsis-v" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(26, 26)];
     [_rightBtn setImage:rightIcon forState:UIControlStateNormal];
     
     UIImage *searchIcon = [UIImage imageWithIcon:@"fa-search" backgroundColor:[UIColor clearColor] iconColor:[UIColor whiteColor] andSize:CGSizeMake(20, 20)];
     [_searchBtn setImage:searchIcon forState:UIControlStateNormal];
     */
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    if (indexPath.row == 0) {
    postCell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    if (!postCell) {
        postCell = [[WPostMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"postCell"];
    }
    postCell.tfShowActivities.inputView = self.pickerAge;
    [postCell.tfShowActivities addDoneOnKeyboardWithTarget:self action:@selector(doneButtonSelected)];
    return postCell;
    //    }
}

- (IBAction)leftOrRightMenuPressed:(UIButton*)sender {
    if (isMenuOpen == NO) {
        [self showMenuView:sender];
        isMenuOpen = YES;
    } else {
        [self hideMenuView];
    }
}

- (void)showMenuView:(UIButton*)sender {
    isMenuOpen = NO;
    UIView * menuParentView = [self.view viewWithTag:11];
    [self.view bringSubviewToFront:menuParentView];
    
    UIView * leftMenu = [self.view viewWithTag:12];
    UIView * rightMenu = [self.view viewWithTag:13];
    
    if (sender.tag == 9) { // Left Menu
        [leftMenu setHidden:NO];
        [rightMenu setHidden:YES];
    }
    else if (sender.tag == 10) { //Right Menu
        [rightMenu setHidden:NO];
        [leftMenu setHidden:YES];
    }
}

- (void)hideMenuView {
    UIView * menuParentView = [self.view viewWithTag:11];
    [self.view sendSubviewToBack:menuParentView];
    isMenuOpen = NO;
}

- (IBAction)menuOptionsPressed:(UIButton*)sender {
    [self hideMenuView];
    if (sender.tag == 20) { //Profile
        UIViewController * profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"profileScreen"];
        [self presentViewController:profileVC animated:YES completion:nil];
    }
    else if (sender.tag == 21) { // Friends
        UIViewController * friendVC = [self.storyboard instantiateViewControllerWithIdentifier:@"friendScreen"];
        [self presentViewController:friendVC animated:YES completion:nil];
    }
    else if (sender.tag == 24) { // Logout
        [[WSettings sessionSettings]clearSession];
        AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate backToInitialViewControllerFrom:self];
    }
    
}

- (IBAction)showActivitiesPressed:(id)sender {
    [self.pickerAge selectRow:0 inComponent:0 animated:NO];
    [postCell.tfShowActivities becomeFirstResponder];
}

- (void)doneButtonSelected {
    [self.view endEditing:YES];
    
}




#pragma mark PickerView
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView; {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component; {
    return [self.pickerArray count];
}

- (NSString*) pickerView:(UIPickerView*)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.pickerArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component; {
    NSString * lab = [[NSString alloc]initWithFormat:@"%@",[self.pickerArray objectAtIndex:row]];
    postCell.tfShowActivities.text = lab;
    //    [self.view endEditing:YES];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        CGRect frame = CGRectMake(0.0, 0.0, 300, 30);
        tView = [[UILabel alloc] initWithFrame:frame];
        tView.font = [UIFont fontWithName:@"Helvetica" size:14];
        tView.textAlignment = NSTextAlignmentCenter;
    }
    postCell.tfShowActivities.inputView = pickerView;
    
    tView.text=[self.pickerArray objectAtIndex:row];
    return tView;
}





@end













