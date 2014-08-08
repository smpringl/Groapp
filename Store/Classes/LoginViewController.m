//
//  LoginViewController.m
//  UrbnEarth
//
//  Created by Trey Pringle on 8/5/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "EmailSignupViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize logo, shellView, facebookLog, backgroundview, opblack, contentHolder, lorr, emailHolder, passwordHolder, loginBtn, twitterLog, signupEmailBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
	// Do any additional setup after loading the view, typically from a nib.
    if ([PFUser currentUser] && // Check if a user is cached
        [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) // Check if user is linked to Facebook
    {
        // Push the next view controller without animation
        [self.navigationController pushViewController:
         [HomeViewController alloc] animated:NO];
    }
    
    
    /*shellView = [[UIView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height-300)/2, self.view.frame.size.width, 300)];
     [self.view addSubview:shellView];
     
     UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, shellView.frame.size.width, 20)];
     welcomeLabel.textColor = [UIColor blackColor];
     welcomeLabel.textAlignment = NSTextAlignmentCenter;
     [welcomeLabel setFont:[UIFont systemFontOfSize:20]];
     welcomeLabel.text = [NSString stringWithFormat:@"Welcome to:"];
     [shellView addSubview:welcomeLabel];
     
     logo = [[UIImageView alloc] initWithFrame:CGRectMake((shellView.frame.size.width-260)/2, 100, 260, 62)];
     logo.image = [UIImage imageNamed:@"OnTask.png"];
     [shellView addSubview:logo];
     
     UILabel *logOrSign = [[UILabel alloc] initWithFrame:CGRectMake(0, shellView.frame.size.height-80, shellView.frame.size.width, 15)];
     logOrSign.textColor = [UIColor blackColor];
     logOrSign.textAlignment = NSTextAlignmentCenter;
     [logOrSign setFont:[UIFont systemFontOfSize:12]];
     logOrSign.text = [NSString stringWithFormat:@"Log in or sign up to get started"];
     [shellView addSubview:logOrSign];*/
    
    backgroundview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    backgroundview.image = [UIImage imageNamed:(@"login2.png")];
    backgroundview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroundview];
    
    opblack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backgroundview.frame.size.width, backgroundview.frame.size.height)];
    opblack.backgroundColor = [UIColor blackColor];
    opblack.alpha = 0.45;
    [backgroundview addSubview:opblack];
    
    contentHolder = [[UIView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height-310)/2, self.view.frame.size.width, 310)];
    [self.view addSubview:contentHolder];
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-300)/2, 0, 300, 82)];
    logo.image = [UIImage imageNamed:(@"UrbnEarth-Hi-Res-Logo.png")];
    logo.contentMode = UIViewContentModeScaleAspectFill;
    [contentHolder addSubview:logo];
    
    /*lorr = [[UILabel alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 100, 250, 40)];
     [lorr setFont:[UIFont boldSystemFontOfSize:14]];
     [lorr setTextColor:[UIColor whiteColor]];
     [lorr setText:@"Login or Register"];
     [contentHolder addSubview:lorr];
     
     emailHolder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 140, 250, 40)];
     emailHolder.layer.borderColor = [UIColor whiteColor].CGColor;
     emailHolder.layer.borderWidth = 1.0f;
     emailHolder.layer.cornerRadius = 5.0f;
     [contentHolder addSubview:emailHolder];
     
     passwordHolder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 200, 250, 40)];
     passwordHolder.layer.borderColor = [UIColor whiteColor].CGColor;
     passwordHolder.layer.borderWidth = 1.0f;
     passwordHolder.layer.cornerRadius = 5.0f;
     [contentHolder addSubview:passwordHolder];
     
     loginBtn = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 260, 250, 50)];
     [loginBtn addTarget:self action:@selector(saveTap:) forControlEvents:UIControlEventTouchUpInside];
     [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     loginBtn.backgroundColor = [UIColor colorWithRed:80.0f/255.0f
     green:164.0f/255.0f
     blue:254.0f/255.0f
     alpha:1.0f];
     [loginBtn setTitle:@"Login" forState:UIControlStateNormal];
     [loginBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
     //addBtn.layer.cornerRadius = 5.0f;
     loginBtn.clipsToBounds = YES;
     //loginBtn.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
     //loginBtn.layer.borderWidth = 1.0f;
     loginBtn.layer.cornerRadius = 5.0f;
     [contentHolder addSubview:loginBtn];*/
    
    facebookLog = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 140, 250, 50)];
    [facebookLog setTitle:@"Log in with Facebook" forState:UIControlStateNormal];
    [facebookLog addTarget:self action:@selector(loginButtonTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [facebookLog.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    facebookLog.layer.cornerRadius = 8.0f;
    [facebookLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [facebookLog setBackgroundColor:[UIColor colorWithRed:41.0f/255.0f
                                                    green:128.0f/255.0f
                                                     blue:185.0f/255.0f
                                                    alpha:1.0f]];
    [facebookLog setImage:[self imageWithImage:[UIImage imageNamed:@"485-facebook@2x.png"] scaledToSize:CGSizeMake(15,15)] forState:UIControlStateNormal];
    CGFloat spacing = 5; // the amount of spacing to appear between image and title
    facebookLog.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    facebookLog.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [contentHolder addSubview:facebookLog];
    
    twitterLog = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 200, 250, 50)];
    [twitterLog setTitle:@"Log in with Twitter" forState:UIControlStateNormal];
    [twitterLog addTarget:self action:@selector(twitterLoginTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [twitterLog.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    twitterLog.layer.cornerRadius = 8.0f;
    [twitterLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [twitterLog setBackgroundColor:[UIColor colorWithRed:29.0f/255.0f
                                                    green:202.0f/255.0f
                                                     blue:255.0f/255.0f
                                                    alpha:1.0f]];
    [twitterLog setImage:[self imageWithImage:[UIImage imageNamed:@"485-facebook@2x.png"] scaledToSize:CGSizeMake(15,15)] forState:UIControlStateNormal];
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    twitterLog.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    twitterLog.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [contentHolder addSubview:twitterLog];
    
    signupEmailBtn = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 260, 250, 50)];
    [signupEmailBtn setTitle:@"Log in with email" forState:UIControlStateNormal];
    [signupEmailBtn addTarget:self action:@selector(suEmailTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [signupEmailBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    signupEmailBtn.layer.cornerRadius = 8.0f;
    [signupEmailBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signupEmailBtn setBackgroundColor:[UIColor colorWithRed:29.0f/255.0f
                                                   green:202.0f/255.0f
                                                    blue:255.0f/255.0f
                                                   alpha:1.0f]];
    [signupEmailBtn setImage:[self imageWithImage:[UIImage imageNamed:@"485-facebook@2x.png"] scaledToSize:CGSizeMake(15,15)] forState:UIControlStateNormal];
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    signupEmailBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    signupEmailBtn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [contentHolder addSubview:signupEmailBtn];
    
}
- (void)loginButtonTouchHandler:(id)sender {
    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        //[_activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            [self.navigationController pushViewController:
             [HomeViewController alloc] animated:NO];
        } else {
            NSLog(@"User with facebook logged in!");
            [self.navigationController pushViewController:
             [HomeViewController alloc] animated:NO];
        }
    }];
}

- (void)twitterLoginTouchHandler:(id)sender {
    [PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error) {
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Twitter login.");
            return;
        } else if (user.isNew) {
            NSLog(@"User signed up and logged in with Twitter!");
        } else {
            NSLog(@"User logged in with Twitter!");
        }    
    }];
}

- (void)suEmailTouchHandler:(id)sender {
    //[self.navigationController pushViewController:
     //[EmailSignupViewController alloc] animated:NO];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    EmailSignupViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"emailsignup"];
    [self.navigationController pushViewController:viewController animated:YES];
}

-(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
