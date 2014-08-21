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
BOOL forgotShowing = NO;
@synthesize facebookLog, backgroundview, opblack, contentHolder, topHolder, emailHolder, passwordHolder, loginBtn, twitterLog, signupEmailBtn, ueUserFirstName, ueUserLastName, ueUserFBID, ueUserEmail, logUserEmail, logUserPass, regularLog, forgotpassowrd, forgotPassText, backToLogin;

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
    
    UIView *translucentheader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    translucentheader.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    
    
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
    [translucentheader addSubview:headerlabel];
    [self.view addSubview:translucentheader];
    
    contentHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 370)];
     [self.view addSubview:contentHolder];
    
    topHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentHolder.frame.size.width, 160)];
    [contentHolder addSubview:topHolder];
    
    
    facebookLog = [[UIButton alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-250)/2, 0, 250, 45)];
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
    [topHolder addSubview:facebookLog];
    
    UIView *facebookBorder = [[UIView alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-250)/2, 45, 250, 3)];
    facebookBorder.backgroundColor = [UIColor colorWithRed:22.0f/255.0f
                                                     green:40.0f/255.0f
                                                      blue:73.0f/255.0f
                                                     alpha:1.0f];
    [topHolder addSubview:facebookBorder];
    
    twitterLog = [[UIButton alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-250)/2, 55, 250, 45)];
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
    [topHolder addSubview:twitterLog];
    
    UIView *twitterBorder = [[UIView alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-250)/2, 100, 250, 3)];
    twitterBorder.backgroundColor = [UIColor colorWithRed:38.0f/255.0f
                                                     green:139.0f/255.0f
                                                      blue:173.0f/255.0f
                                                     alpha:1.0f];
    [topHolder addSubview:twitterBorder];
    
    UIView *whitediv = [[UIView alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-235)/2, 113, 235, 2)];
    whitediv.backgroundColor = [UIColor whiteColor];
    whitediv.alpha = 0.8f;
    [topHolder addSubview:whitediv];
    
    UILabel *logmessage = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, 120, 280, 40)];
    logmessage.text = @"Login with your UrbnEarth account credentials, by doing so you agree to the Terms & Conditions and Privacy Policy.";
    logmessage.numberOfLines = 2;
    logmessage.textColor = [UIColor whiteColor];
    logmessage.font = [UIFont fontWithName:@"Avenir-Black" size:10.0];
    logmessage.textAlignment = NSTextAlignmentCenter;
    [topHolder addSubview:logmessage];
    
    emailHolder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-290)/2, 170, 290, 50)];
    emailHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [contentHolder addSubview:emailHolder];
    
    logUserEmail = [[UITextField alloc] initWithFrame:CGRectMake(25, 0, 240, 50)];
    //textField.borderStyle = UITextBorderStyleRoundedRect;
    [logUserEmail setBackgroundColor:[UIColor clearColor]];
    logUserEmail.font = [UIFont systemFontOfSize:15];
    logUserEmail.placeholder = @"Email";
    logUserEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    logUserEmail.keyboardType = UIKeyboardTypeDefault;
    logUserEmail.returnKeyType = UIReturnKeyDone;
    logUserEmail.clearButtonMode = UITextFieldViewModeWhileEditing;
    logUserEmail.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    logUserEmail.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    UIColor *color = [UIColor darkGrayColor];
    logUserEmail.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Email"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0]
                                                 }];
    [self.logUserEmail setDelegate:self];
    [logUserEmail addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    [emailHolder addSubview:logUserEmail];
    
    passwordHolder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-290)/2, 225, 290, 50)];
    passwordHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [contentHolder addSubview:passwordHolder];
    
    logUserPass = [[UITextField alloc] initWithFrame:CGRectMake(25, 0, 240, 50)];
    //textField.borderStyle = UITextBorderStyleRoundedRect;
    [logUserPass setBackgroundColor:[UIColor clearColor]];
    logUserPass.font = [UIFont systemFontOfSize:15];
    //textField.placeholder = @"Email";
    logUserPass.secureTextEntry = YES;//for password entry
    [logUserPass addTarget:self
                    action:@selector(textFieldFinished:)
          forControlEvents:UIControlEventEditingDidEndOnExit];
    logUserPass.autocorrectionType = UITextAutocorrectionTypeNo;
    logUserPass.keyboardType = UIKeyboardTypeDefault;
    logUserPass.returnKeyType = UIReturnKeyDone;
    logUserPass.clearButtonMode = UITextFieldViewModeWhileEditing;
    logUserPass.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    logUserPass.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:17];
    logUserPass.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Password"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:17.0]
                                                 }];
    [self.logUserPass setDelegate:self];
    
    [passwordHolder addSubview:logUserPass];
    
    regularLog = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-250)/2, 290, 250, 45)];
    [regularLog setTitle:@"LOG IN" forState:UIControlStateNormal];
    [regularLog addTarget:self action:@selector(emailLoginTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [regularLog.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
    //facebookLog.layer.cornerRadius = 8.0f;
    [regularLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [regularLog setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f
                                                    green:132.0f/255.0f
                                                     blue:38.0f/255.0f
                                                    alpha:1.0f]];
    [contentHolder addSubview:regularLog];
    
    UIView *regBorder = [[UIView alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-250)/2, 335, 250, 3)];
    regBorder.backgroundColor = [UIColor colorWithRed:186.0f/255.0f
                                                     green:101.0f/255.0f
                                                      blue:30.0f/255.0f
                                                     alpha:1.0f];
    [contentHolder addSubview:regBorder];
    
    forgotpassowrd = [[UIButton alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-200)/2, 340, 200, 30)];
    [forgotpassowrd setTitle:@"Forgot passowrd?" forState:UIControlStateNormal];
    [forgotpassowrd addTarget:self action:@selector(forgotPasswordTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [forgotpassowrd.titleLabel setFont:[UIFont fontWithName:@"Avenir-Black" size:12.0]];
    //facebookLog.layer.cornerRadius = 8.0f;
    [forgotpassowrd setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [contentHolder addSubview:forgotpassowrd];
    
    opblack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    opblack.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transblack.png"]];
    opblack.alpha = 0;
    [self.view addSubview:opblack];
    
    UIView *forgotBox = [[UIView alloc] initWithFrame:CGRectMake((opblack.frame.size.width-280)/2, 100, 280, 320)];
    forgotBox.backgroundColor = [UIColor whiteColor];
    forgotBox.layer.shadowColor = [[UIColor blackColor] CGColor];
    forgotBox.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    forgotBox.layer.shadowRadius = 5.0f;
    forgotBox.layer.shadowOpacity = 1.0f;
    [opblack addSubview:forgotBox];
    
    UILabel *passHeader = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, forgotBox.frame.size.width, 50)];
    passHeader.text = @"Forgot Password?";
    passHeader.textColor = [UIColor whiteColor];
    passHeader.backgroundColor = [UIColor blackColor];
    passHeader.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18.0];
    passHeader.textAlignment = NSTextAlignmentCenter;
    [forgotBox addSubview:passHeader];
    
    UILabel *passBody = [[UILabel alloc]initWithFrame:CGRectMake((forgotBox.frame.size.width-220)/2, 60, 220, 60)];
    passBody.text = @"No worries!\nEnter your email and we'll send you link to reset your password:";
    passBody.numberOfLines = 3;
    passBody.textColor = [UIColor blackColor];
    passBody.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0];
    passBody.textAlignment = NSTextAlignmentCenter;
    [forgotBox addSubview:passBody];
    
    UIView *fpholder = [[UIView alloc] initWithFrame:CGRectMake((forgotBox.frame.size.width-220)/2, 140, 220, 50)];
    fpholder.backgroundColor = [UIColor colorWithRed:230.0f/255.0f
                                               green:230.0f/255.0f
                                                blue:230.0f/255.0f
                                               alpha:1.0f];
    [forgotBox addSubview:fpholder];
    
    forgotPassText = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, 180, 50)];
    [forgotPassText setBackgroundColor:[UIColor clearColor]];
    forgotPassText.font = [UIFont systemFontOfSize:15];
    forgotPassText.placeholder = @"Email";
    forgotPassText.autocorrectionType = UITextAutocorrectionTypeNo;
    forgotPassText.keyboardType = UIKeyboardTypeDefault;
    forgotPassText.returnKeyType = UIReturnKeyDone;
    forgotPassText.clearButtonMode = UITextFieldViewModeWhileEditing;
    forgotPassText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    forgotPassText.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    forgotPassText.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Email"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]
                                                 }];
    [self.forgotPassText setDelegate:self];
    [forgotPassText addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    [fpholder addSubview:forgotPassText];
    
    UIButton *submitFP = [[UIButton alloc] initWithFrame:CGRectMake((forgotBox.frame.size.width-220)/2, 210, 220, 50)];
    [submitFP setTitle:@"RESET PASSWORD" forState:UIControlStateNormal];
    [submitFP addTarget:self action:@selector(sendPasswordTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [submitFP.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:15.0]];
    [submitFP setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitFP setBackgroundColor:[UIColor colorWithRed:54.0f/255.0f
                                                 green:54.0f/255.0f
                                                  blue:54.0f/255.0f
                                                 alpha:1.0f]];
    [forgotBox addSubview:submitFP];
    
    backToLogin = [[UIButton alloc] initWithFrame:CGRectMake(0, 270, forgotBox.frame.size.width, 40)];
    [backToLogin setTitle:@"Log in to Sovi" forState:UIControlStateNormal];
    [backToLogin addTarget:self action:@selector(showLoginTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [backToLogin.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:12.0]];
    [backToLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forgotBox addSubview:backToLogin];
    
}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    if (forgotShowing == NO) {
        [UIView animateWithDuration:0.2 delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             topHolder.alpha = 0.0f;
                             contentHolder.frame = CGRectMake(0, -100, self.view.frame.size.width, 310);
                         }
                         completion:nil];
    }
    else {
        //do nothing
    }
}


- (IBAction)textFieldFinished:(id)sender
{
    // [sender resignFirstResponder];
    if (forgotShowing == NO) {
        [UIView animateWithDuration:0.3 delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             topHolder.alpha = 1.0f;
                             contentHolder.frame = CGRectMake(0, 80, self.view.frame.size.width, 310);
                         }
                         completion:nil];
    }
    else {
        //do nothing
    }
    
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
        currentUser[@"username"] = ueUserEmail;
        currentUser[@"firstname"] = ueUserFirstName;
        currentUser[@"lastname"] = ueUserLastName;
        [[PFUser currentUser] saveInBackground];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        HomeViewController *homecontroller = [storyboard instantiateViewControllerWithIdentifier:@"homeview"];
        [self presentViewController:homecontroller animated:YES completion:nil];
    } else {
        // do nothing
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

- (void)emailLoginTouchHandler:(id)sender {
    NSLog(@"email login");
    [PFUser logInWithUsernameInBackground:logUserEmail.text password:logUserPass.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            // Do stuff after successful login.
                                            NSLog(@"User Logged In");
                                            
                                            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
                                            HomeViewController *homecontroller = [storyboard instantiateViewControllerWithIdentifier:@"homeview"];
                                            [self presentViewController:homecontroller animated:YES completion:nil];
                                            
                                            
                                        } else {
                                            // The login failed. Check error to see why.
                                            UIAlertView *loginFailAlert = [[UIAlertView alloc] initWithTitle: @"Please try again"
                                                                                                     message:@"The email or password you entered is incorrect"
                                                                                                    delegate:self
                                                                                           cancelButtonTitle:@"Ok"
                                                                                           otherButtonTitles: nil   ];
                                            
                                            [loginFailAlert show];
                                        }
                                    }];
    
}

- (void)forgotPasswordTouchHandler:(id)sender {
    [UIView animateWithDuration:0.3 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         opblack.alpha = 1;
                     }
                     completion:nil];
    forgotShowing = YES;
}

- (void)showLoginTouchHandler:(id)sender {
    [UIView animateWithDuration:0.3 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         opblack.alpha = 0;
                     }
                     completion:nil];
    forgotShowing = NO;
}

- (void)sendPasswordTouchHandler:(id)sender {
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    
    [indicator startAnimating];
    [PFUser requestPasswordResetForEmailInBackground:forgotPassText.text];
    [UIView animateWithDuration:0.7 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         opblack.alpha = 0;
                     }
                     completion:nil];
    forgotShowing = NO;
    [indicator stopAnimating];
    
    UIAlertView *resetSent = [[UIAlertView alloc] initWithTitle: @"Link Sent!"
                                                        message:@"Please check your email for a link to reset your password"
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil   ];
    
    [resetSent show];
}

- (void)BackTouchHandler:(id)sender {
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