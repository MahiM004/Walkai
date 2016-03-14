//
//  WFriendListVC.m
//  Walkai
//
//  Created by Mahesh_iOS on 14/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import "WFriendListVC.h"
#import "WFriendFetcher.h"
#import "Friends.h"
#import "Friends+AppServer.h"
#import "WFriendListCell.h"

@interface WFriendListVC () <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *friendsArray;
@property (weak, nonatomic) IBOutlet UITableView *friendTable;

@end

@implementation WFriendListVC

- (NSMutableArray *)friendsArray {
    
    if (!_friendsArray) _friendsArray = [[NSMutableArray alloc] init];
    return _friendsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getFriendList];
}

- (void)getFriendList {
    NSString * url = [NSString stringWithFormat:@"%@",[WFriendFetcher URLForGetFriendsList]];
    NSDictionary * params = @{
                              @"username":[[WSettings sessionSettings] fullName],
                              @"limit":@"10",
                              @"offset":@"0"
                              };
    
    [WConnectionHelper getDataFromURL:url withParameters:params contentType:kContentTypeJSON success:^(NSDictionary *response) {
        NSDictionary * resultDic = [response valueForKey:@"result"];
        if (resultDic) {
            if ([[resultDic valueForKey:@"success"]boolValue]) {
                if ([resultDic valueForKey:@"friendslist"]) {
                    NSArray * friendList = [resultDic valueForKey:@"friendslist"];
                    if (friendList.count != 0) {
                        self.friendsArray = [Friends loadFriendsFromAppServerArray:friendList forFriendsArray:self.friendsArray];
                        [self.friendTable reloadData];
                    }
                }
            }
            else {
                if ([resultDic valueForKey:@"message"]) {
                    [WViewUtility showAlert:@"Failed" msg:resultDic[@"message"]];
                    return;
                }
            }
        }
    } failed:^(NSError *error) {
        [WViewUtility showAlert:@"Failed" msg:@"Some thing went wrong please try again"];
        NSLog(@"%@",error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friendsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WFriendListCell * friendCell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    if (!friendCell) {
        friendCell = [[WFriendListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"friendCell"];
    }
    Friends * singleFriend = self.friendsArray[indexPath.row];
    friendCell.lblFriendName.text = singleFriend.name;
    [friendCell.imgFriend setImageWithURL:[NSURL URLWithString:singleFriend.avatar_url]];
    
    return friendCell;
}






- (IBAction)closeFriends:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
