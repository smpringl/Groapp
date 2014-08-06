//
//  LoginViewController.h
//  UrbnEarth
//
//  Created by Trey Pringle on 8/5/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *shellView;
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UIButton *facebookLog;
@property (nonatomic, retain) UIImageView *backgroundview;
@property (nonatomic, retain) UIView *opblack;
@property (nonatomic, retain) UIView *contentHolder;
@property (nonatomic, retain) UILabel *lorr;
@property (nonatomic, retain) UIView *emailHolder;
@property (nonatomic, retain) UIView *passwordHolder;
@property (nonatomic, retain) IBOutlet UIButton *loginBtn;

@end
