//
//  WProfileScreen.m
//  Walkai
//
//  Created by Mahesh_iOS on 10/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WProfileScreen.h"
#import "WUserFetcher.h"
#import "WProfileCollecCell.h"
#import "User.h"
#import "User+AppServer.h"
#import <UIImageView+AFNetworking.h>
@interface WProfileScreen () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) User *user;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UIImageView *userProfilePicture;


@end

@implementation WProfileScreen

- (void)viewDidLoad {
    [super viewDidLoad];

    [self fetchUserInfoWithSuccess:^(User *user) {
        [self updateUI:user];
    } failure:^(NSError *error) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self getUserProfile];
}

- (void)updateUI:(User *)user {
    [self.userName setText:user.name];
    [self.userProfilePicture setImageWithURL:[NSURL URLWithString:user.image]];
}

#pragma mark - User Info RESTful

- (void)fetchUserInfoWithSuccess:(void (^)(id  responseObject)) success
                         failure:(void (^)(NSError *error)) failure {
    NSString * url = [NSString stringWithFormat:@"%@",[WUserFetcher URLforGetUserProfile]];
    NSDictionary * params = (@{
                               @"userid":[[WSettings sessionSettings]userID],
                               @"auth_token":[[WSettings sessionSettings]token],
                               @"api_key":[[WSettings sessionSettings]apikey]
                               });
    
    [WConnectionHelper getDataFromURL:url withParameters:params contentType:kContentTypeJSON success:^(NSDictionary *response) {
        self.user = [[User alloc]init];
        self.user = [User userWithAppServerInfo:response forUser:self.user];
        success(self.user);
    } failed:^(NSError *error) {
        failure(error);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [WViewUtility getProfileArray].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WProfileCollecCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"profileCell" forIndexPath:indexPath];
    NSDictionary * singleObject = [WViewUtility getProfileArray][indexPath.row];
    cell.lblTitle.text = singleObject[@"title"];
    cell.imgView.image = [UIImage imageNamed:singleObject[@"icon"]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(SCREEN_WIDTH/3-12, SCREEN_WIDTH/3-12);
}

- (IBAction)closeProfile:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
