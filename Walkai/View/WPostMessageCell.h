//
//  WPostMessageCell.h
//  Walkai
//
//  Created by Mahesh_iOS on 07/03/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPostMessageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *postMessageView;
@property (weak, nonatomic) IBOutlet UIButton *postMessageBtn;
@property (weak, nonatomic) IBOutlet UITextField *tfShowActivities;
@property (weak, nonatomic) IBOutlet UIButton *showActivities;

@end
