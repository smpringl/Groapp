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
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
	// Do any additional setup after loading the view, typically from a nib.
    if ([PFUser currentUser] && // Check if a user is cached
        [PFFacebookUtils isLinkedWithUser:[PFUser currentUser]]) // Check if user is linked to Facebook
    {
        // Push the next view controller without animation
        [self.navigationController pushViewController:
         [HomeViewController alloc] animated:NO];
    }
    
    
    backgroundview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    backgroundview.image = [UIImage imageNamed:(@"Login_Screen_bg.png")];
    backgroundview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroundview];
    
    opblack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backgroundview.frame.size.width, backgroundview.frame.size.height)];
    opblack.backgroundColor = [UIColor blackColor];
    opblack.alpha = 0.05;
    [backgroundview addSubview:opblack];
    
    UIView *translucentheader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    translucentheader.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [self.view addSubview:translucentheader];
    
    /*back to landing view*/
    UIButton *BackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 80, 40)];
    [BackBtn setTitle:@"Back" forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(BackTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [BackBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0]];
    [BackBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [BackBtn setBackgroundColor:[UIColor clearColor]];
    [BackBtn setImage:[self imageWithImage:[UIImage imageNamed:@"backarrow.png"] scaledToSize:CGSizeMake(13,21)] forState:UIControlStateNormal];
    CGFloat spacing = 5; // the amount of spacing to appear between image and title
    BackBtn.imageEdgeInsets = UIEdgeInsetsMake(1, 0, 0, spacing);
    BackBtn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [translucentheader addSubview:BackBtn];
    
    UILabel *headerlabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 20, 200, 40)];
    headerlabel.text = @"LOG IN";
    headerlabel.textColor = [UIColor blackColor];
    headerlabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
    headerlabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:headerlabel];
    
    
    contentHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 310)];
     [self.view addSubview:contentHolder];
    
    
    facebookLog = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 0, 250, 45)];
    [facebookLog setTitle:@"LOG IN WITH FACEBOOK" forState:UIControlStateNormal];
    [facebookLog addTarget:self action:@selector(loginButtonTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [facebookLog.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
    //facebookLog.layer.cornerRadius = 8.0f;
    [facebookLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [facebookLog setBackgroundColor:[UIColor colorWithRed:35.0f/255.0f
                                                    green:62.0f/255.0f
                                                     blue:113.0f/255.0f
                                                    alpha:1.0f]];
    [facebookLog setImage:[self imageWithImage:[UIImage imageNamed:@"Facebook-Icon.png"] scaledToSize:CGSizeMake(30,30)] forState:UIControlStateNormal];
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    facebookLog.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    facebookLog.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [contentHolder addSubview:facebookLog];
    
    UIView *facebookBorder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 45, 250, 3)];
    facebookBorder.backgroundColor = [UIColor colorWithRed:22.0f/255.0f
                                                     green:40.0f/255.0f
                                                      blue:73.0f/255.0f
                                                     alpha:1.0f];
    [contentHolder addSubview:facebookBorder];
    
    twitterLog = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 55, 250, 45)];
    [twitterLog setTitle:@"LOG IN WITH TWITTER" forState:UIControlStateNormal];
    [twitterLog addTarget:self action:@selector(twitterLoginTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [twitterLog.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
    [twitterLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [twitterLog setBackgroundColor:[UIColor colorWithRed:51.0f/255.0f
                                                    green:204.0f/255.0f
                                                     blue:255.0f/255.0f
                                                    alpha:1.0f]];
    [twitterLog setImage:[self imageWithImage:[UIImage imageNamed:@"Twitter-Icon.png"] scaledToSize:CGSizeMake(30,30)] forState:UIControlStateNormal];
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    twitterLog.imageEdgeInsets = UIEdgeInsetsMake(0, -22, 0, 0);
    twitterLog.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [contentHolder addSubview:twitterLog];
    
    UIView *twitterBorder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 100, 250, 3)];
    twitterBorder.backgroundColor = [UIColor colorWithRed:38.0f/255.0f
                                                     green:139.0f/255.0f
                                                      blue:173.0f/255.0f
                                                     alpha:1.0f];
    [contentHolder addSubview:twitterBorder];
    
    UIView *whitediv = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-235)/2, 113, 235, 2)];
    whitediv.backgroundColor = [UIColor whiteColor];
    whitediv.alpha = 0.8f;
    [contentHolder addSubview:whitediv];
    
    UILabel *logmessage = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, 120, 280, 40)];
    logmessage.text = @"Login with your UrbnEarth account credentials, by doing so you agree to the Terms & Conditions and Privacy Policy.";
    logmessage.numberOfLines = 2;
    logmessage.textColor = [UIColor whiteColor];
    logmessage.font = [UIFont fontWithName:@"Avenir-Black" size:10.0];
    logmessage.textAlignment = NSTextAlignmentCenter;
    [contentHolder addSubview:logmessage];
    
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
