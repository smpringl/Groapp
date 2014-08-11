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
@synthesize logo, shellView, facebookLog, backgroundview, opblack, contentHolder, lorr, emailHolder, passwordHolder, loginBtn, twitterLog, signupEmailBtn, ueUserFirstName, ueUserLastName, ueUserFBID, ueUserEmail;

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
    
    /*sign up with email button*/
    UIButton *BackBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-250)/2, self.view.frame.size.height-60, 250, 50)];
    [BackBtn setTitle:@"Back" forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(BackTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [BackBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    BackBtn.layer.cornerRadius = 8.0f;
    [BackBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [BackBtn setBackgroundColor:[UIColor colorWithRed:29.0f/255.0f
                                                green:202.0f/255.0f
                                                 blue:255.0f/255.0f
                                                alpha:1.0f]];
    //[signupEmailBtn setImage:[self imageWithImage:[UIImage imageNamed:@"485-facebook@2x.png"] scaledToSize:CGSizeMake(15,15)] forState:UIControlStateNormal];
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    //signupEmailBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    //signupEmailBtn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [self.view addSubview:BackBtn];
    
}
- (void)loginButtonTouchHandler:(id)sender {
    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location", @"email"];
    
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
            /*[self.navigationController pushViewController:
             [HomeViewController alloc] animated:NO];*/
            [self writeFacebookData];
            
        } else {
            NSLog(@"User with facebook logged in!");
            [self.navigationController pushViewController:
             [HomeViewController alloc] animated:NO];
        }
    }];
}

-(void)writeFacebookData {
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    
    [indicator startAnimating];
    
    [FBRequestConnection
     startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             NSLog(@"startedfbdrop");
             NSString *usrfbid = [result objectForKey:@"id"];
             ueUserFBID = usrfbid;
             NSString *usremail = [result objectForKey:@"email"];
             ueUserEmail = usremail;
             NSString *firstname = [result objectForKey:@"first_name"];
             ueUserFirstName = firstname;
             NSString *lastname = [result objectForKey:@"last_name"];
             ueUserLastName = lastname;
             NSLog(ueUserLastName);
             
             [indicator stopAnimating];
             //[[PFUser currentUser] saveInBackground];
             [self storeUserData];
         }
     }];
}

- (void)storeUserData {
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        // do stuff with the user
        NSLog(@"madeithere");
        currentUser[@"fbid"] = ueUserFBID;
        currentUser[@"email"] = ueUserEmail;
        currentUser[@"firstname"] = ueUserFirstName;
        currentUser[@"lastname"] = ueUserLastName;
        [[PFUser currentUser] saveInBackground];
        
        [self.navigationController pushViewController:
         [HomeViewController alloc] animated:NO];
    } else {
        // show the signup or login screen
    }
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
    //[self.navigationController pushViewController:viewController animated:YES];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    [self presentViewController:viewController animated:NO completion:nil];
    
    //viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //[self presentViewController:viewController animated:YES completion:nil];
}

- (void)BackTouchHandler:(id)sender {
    //[self.navigationController popViewControllerAnimated:YES];
    
    /*dismiss view controller back to landing view*/
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    [self dismissViewControllerAnimated:NO completion:nil];
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
