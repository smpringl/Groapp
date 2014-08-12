//
//  LoginViewController.h
//  UrbnEarth
//
//  Created by Trey Pringle on 8/5/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *facebookLog;
@property (nonatomic, retain) UIImageView *backgroundview;
@property (nonatomic, retain) UIView *opblack;
@property (nonatomic, retain) UIView *contentHolder;
@property (nonatomic, retain) UIView *topHolder;
@property (nonatomic, retain) UIView *emailHolder;
@property (nonatomic, retain) UIView *passwordHolder;
@property (nonatomic, retain) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UIButton *twitterLog;
@property (strong, nonatomic) IBOutlet UIButton *signupEmailBtn;

@property (nonatomic, retain) NSString *ueUserFBID;
@property (nonatomic, retain) NSString *ueUserEmail;
@property (nonatomic, retain) NSString *ueUserFirstName;
@property (nonatomic, retain) NSString *ueUserLastName;

@property (strong, nonatomic) IBOutlet UITextField *logUserEmail;
@property (strong, nonatomic) IBOutlet UITextField *logUserPass;
@property (strong, nonatomic) IBOutlet UIButton *regularLog;

@property (strong, nonatomic) IBOutlet UIButton *forgotpassowrd;
@end
