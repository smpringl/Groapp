//
//  EmailSignupViewController.h
//  UrbnEarth
//
//  Created by Trey Pringle on 8/7/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailSignupViewController : UIViewController

@property (nonatomic, retain) UIView *contentHolder;
@property (nonatomic, retain) UIView *topHolder;
@property (nonatomic, retain) UIView *bottomHolder;
@property (strong, nonatomic) IBOutlet UIButton *facebookLog;

@property (strong, nonatomic) IBOutlet UIButton *maleBtn;
@property (strong, nonatomic) IBOutlet UIButton *femaleBtn;

@property (nonatomic, retain) NSString *ueUserFBID;
@property (nonatomic, retain) NSString *ueUserEmail;
@property (nonatomic, retain) NSString *ueUserFirstName;
@property (nonatomic, retain) NSString *ueUserLastName;
@property (nonatomic, retain) NSString *gender;

@property (strong, nonatomic) IBOutlet UITextField *FirstName;
@property (strong, nonatomic) IBOutlet UITextField *LastName;
@property (strong, nonatomic) IBOutlet UITextField *UserEmail;
@property (strong, nonatomic) IBOutlet UITextField *UserPass;
@property (strong, nonatomic) IBOutlet UITextField *ZipCode;

@end
