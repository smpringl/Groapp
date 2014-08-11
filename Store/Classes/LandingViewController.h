//
//  LandingViewController.h
//  UrbnEarth
//
//  Created by Trey Pringle on 8/10/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LandingViewController : UIViewController

@property (strong, nonatomic) UIImageView *logo;
@property (nonatomic, retain) UILabel *pageMessage;
@property (nonatomic, retain) UIImageView *backgroundview;
@property (nonatomic, retain) UIView *opblack;
@property (nonatomic, retain) UIView *contentHolder;

@property (strong, nonatomic) IBOutlet UIButton *LoginBtn;
@property (strong, nonatomic) IBOutlet UIButton *RegisterBtn;

@end
