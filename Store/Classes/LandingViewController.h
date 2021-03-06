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
@property (nonatomic, retain) UIImageView *backgroundview;
@property (nonatomic, retain) UIView *opblack;
@property (nonatomic, retain) UIView *contentHolder;

@property (strong, nonatomic) IBOutlet UIButton *LoginBtn;
@property (strong, nonatomic) IBOutlet UIButton *RegisterBtn;

@property (nonatomic, retain) UIView *tutorialContainer;

@property (nonatomic, retain) UIView *dotOne;
@property (nonatomic, retain) UIView *dotTwo;
@property (nonatomic, retain) UIView *dotThree;
@property (nonatomic, retain) UIView *dotFour;

@end
