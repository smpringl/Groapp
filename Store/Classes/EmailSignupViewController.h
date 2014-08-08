//
//  EmailSignupViewController.h
//  UrbnEarth
//
//  Created by Trey Pringle on 8/7/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmailSignupViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *FullName;
@property (weak, nonatomic) IBOutlet UITextField *UserEmail;
@property (weak, nonatomic) IBOutlet UITextField *UserPass;
@property (weak, nonatomic) IBOutlet UITextField *ZipCode;

@end
