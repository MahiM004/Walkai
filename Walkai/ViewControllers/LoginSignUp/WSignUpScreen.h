//
//  WSignUpScreen.h
//  Walkai
//
//  Created by Mahesh_iOS on 25/02/16.
//  Copyright © 2016 MCA140. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum RegisterType {
    RegisterTypeStudent,
    RegisterTypeProfessional,
}RegisterType;

@interface WSignUpScreen : UIViewController

@property RegisterType registerType;
@end
