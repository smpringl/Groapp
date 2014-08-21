//
//  EmailSignupViewController.m
//  UrbnEarth
//
//  Created by Trey Pringle on 8/7/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import "PFStoreAppDelegate.h"
#import "EmailSignupViewController.h"
#import "HomeViewController.h"

@interface EmailSignupViewController ()


@end

@implementation EmailSignupViewController
BOOL maleClicked = NO;
BOOL femaleClicked = NO;
@synthesize FirstName, LastName, UserEmail, UserPass, ZipCode, contentHolder, topHolder, facebookLog, ueUserEmail, ueUserFBID, ueUserFirstName, ueUserLastName, bottomHolder, maleBtn, femaleBtn, gender;

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
   
    [self.FirstName addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.LastName addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.UserEmail addTarget:self
                      action:@selector(textFieldFinished:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.UserPass addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backgroundview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    backgroundview.image = [UIImage imageNamed:(@"Login_Screen_bg.png")];
    backgroundview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroundview];
    
    
    contentHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 370)];
    [self.view addSubview:contentHolder];
    
    topHolder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-280)/2, 0, 280, 85)];
    [contentHolder addSubview:topHolder];
    
    bottomHolder = [[UIView alloc] initWithFrame:CGRectMake((contentHolder.frame.size.width-280)/2, 85, 280, 285)];
    [contentHolder addSubview:bottomHolder];
    
    facebookLog = [[UIButton alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-250)/2, 0, 250, 45)];
    [facebookLog setTitle:@"REGISTER WITH FACEBOOK" forState:UIControlStateNormal];
    [facebookLog addTarget:self action:@selector(loginButtonTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [facebookLog.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
    //facebookLog.layer.cornerRadius = 8.0f;
    [facebookLog setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [facebookLog setBackgroundColor:[UIColor colorWithRed:35.0f/255.0f
                                                    green:62.0f/255.0f
                                                     blue:113.0f/255.0f
                                                    alpha:1.0f]];
    [facebookLog setImage:[self imageWithImage:[UIImage imageNamed:@"Facebook-Icon.png"] scaledToSize:CGSizeMake(30,30)] forState:UIControlStateNormal];
    CGFloat spacing = 5; // the amount of spacing to appear between image and title
    facebookLog.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    facebookLog.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [topHolder addSubview:facebookLog];
    
    UIView *facebookBorder = [[UIView alloc] initWithFrame:CGRectMake((topHolder.frame.size.width-250)/2, 45, 250, 3)];
    facebookBorder.backgroundColor = [UIColor colorWithRed:22.0f/255.0f
                                                     green:40.0f/255.0f
                                                      blue:73.0f/255.0f
                                                     alpha:1.0f];
    [topHolder addSubview:facebookBorder];
    
    //THIS IS WHERE YOU LEFT OF, REBUILD THIS IMAGE AND INSERT..................................
    UIImageView *orRegister = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, topHolder.frame.size.width, 30)];
    orRegister.image = [UIImage imageNamed:(@"OR-REGISTER-WITH-EMAIL.png")];
    orRegister.contentMode = UIViewContentModeScaleAspectFill;
    //[self.view addSubview:orRegister];
    
    /*first name field*/
    UIView *firstNameHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (bottomHolder.frame.size.width/2)-3, 40)];
    firstNameHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:firstNameHolder];
    
    FirstName = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, firstNameHolder.frame.size.width-30, 40)];
    [FirstName setBackgroundColor:[UIColor clearColor]];
    FirstName.autocorrectionType = UITextAutocorrectionTypeNo;
    FirstName.keyboardType = UIKeyboardTypeDefault;
    FirstName.returnKeyType = UIReturnKeyDone;
    FirstName.clearButtonMode = UITextFieldViewModeWhileEditing;
    FirstName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    FirstName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    UIColor *color = [UIColor darkGrayColor];
    FirstName.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"First Name"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]
                                                 }];
    [self.FirstName setDelegate:self];
    [FirstName addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    [firstNameHolder addSubview:FirstName];
    
    /*last name field*/
    UIView *lastNameHolder = [[UIView alloc] initWithFrame:CGRectMake((bottomHolder.frame.size.width/2)+3, 0, (bottomHolder.frame.size.width/2)-3, 40)];
    lastNameHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:lastNameHolder];
    
    LastName = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, lastNameHolder.frame.size.width-20, 40)];
    [LastName setBackgroundColor:[UIColor clearColor]];
    LastName.autocorrectionType = UITextAutocorrectionTypeNo;
    LastName.keyboardType = UIKeyboardTypeDefault;
    LastName.returnKeyType = UIReturnKeyDone;
    LastName.clearButtonMode = UITextFieldViewModeWhileEditing;
    LastName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    LastName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    LastName.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Last Name"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]
                                                 }];
    [self.LastName setDelegate:self];
    [LastName addTarget:self
                  action:@selector(textFieldFinished:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    [lastNameHolder addSubview:LastName];
    
    /*email text field*/
    UIView *emailHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 46, bottomHolder.frame.size.width, 40)];
    emailHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:emailHolder];
    
    UserEmail = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, emailHolder.frame.size.width-30, 40)];
    [UserEmail setBackgroundColor:[UIColor clearColor]];
    UserEmail.autocorrectionType = UITextAutocorrectionTypeNo;
    UserEmail.keyboardType = UIKeyboardTypeDefault;
    UserEmail.returnKeyType = UIReturnKeyDone;
    UserEmail.clearButtonMode = UITextFieldViewModeWhileEditing;
    UserEmail.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    UserEmail.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    UserEmail.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Email"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]
                                                 }];
    [self.UserEmail setDelegate:self];
    [UserEmail addTarget:self
                 action:@selector(textFieldFinished:)
       forControlEvents:UIControlEventEditingDidEndOnExit];
    [emailHolder addSubview:UserEmail];
    
    /*password field*/
    UIView *passwordHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 92, bottomHolder.frame.size.width, 40)];
    passwordHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:passwordHolder];
    
    UserPass = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, passwordHolder.frame.size.width-30, 40)];
    [UserPass setBackgroundColor:[UIColor clearColor]];
    UserPass.autocorrectionType = UITextAutocorrectionTypeNo;
    UserPass.keyboardType = UIKeyboardTypeDefault;
    UserPass.returnKeyType = UIReturnKeyDone;
    UserPass.clearButtonMode = UITextFieldViewModeWhileEditing;
    UserPass.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    UserPass.secureTextEntry = YES;//for password entry
    UserPass.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
    UserPass.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Password"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]
                                                 }];
    [self.UserPass setDelegate:self];
    [UserPass addTarget:self
                  action:@selector(textFieldFinished:)
        forControlEvents:UIControlEventEditingDidEndOnExit];
    [passwordHolder addSubview:UserPass];
    
    maleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 138, (bottomHolder.frame.size.width/2)-3, 40)];
    [maleBtn setTitle:@"Male" forState:UIControlStateNormal];
    [maleBtn addTarget:self action:@selector(MaleTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [maleBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]];
    [maleBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [maleBtn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]]];
    [maleBtn setImage:[self imageWithImage:[UIImage imageNamed:@"Ellipse.png"] scaledToSize:CGSizeMake(14,14)] forState:UIControlStateNormal];
    maleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -maleBtn.imageView.frame.size.width, 0, maleBtn.imageView.frame.size.width+60);
    maleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, maleBtn.titleLabel.frame.size.width+60, 0, -maleBtn.titleLabel.frame.size.width);
    [bottomHolder addSubview:maleBtn];
    
    femaleBtn = [[UIButton alloc] initWithFrame:CGRectMake((bottomHolder.frame.size.width/2)+3, 138, (bottomHolder.frame.size.width/2)-3, 40)];
    [femaleBtn setTitle:@"Female" forState:UIControlStateNormal];
    [femaleBtn addTarget:self action:@selector(FemaleTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [femaleBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]];
    [femaleBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [femaleBtn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]]];
    [femaleBtn setImage:[self imageWithImage:[UIImage imageNamed:@"Ellipse.png"] scaledToSize:CGSizeMake(14,14)] forState:UIControlStateNormal];
    femaleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -femaleBtn.imageView.frame.size.width, 0, femaleBtn.imageView.frame.size.width+60);
    femaleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, femaleBtn.titleLabel.frame.size.width+60, 0, -femaleBtn.titleLabel.frame.size.width);
    [bottomHolder addSubview:femaleBtn];
    
    UIButton *RegisterBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 239, bottomHolder.frame.size.width, 45)];
    [RegisterBtn setTitle:@"CREATE ACCOUNT" forState:UIControlStateNormal];
    [RegisterBtn addTarget:self action:@selector(SignUpClicked:) forControlEvents:UIControlEventTouchUpInside];
    [RegisterBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:15.0]];
    [RegisterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RegisterBtn setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f
                                                   green:132.0f/255.0f
                                                    blue:38.0f/255.0f
                                                   alpha:1.0f]];
    [bottomHolder addSubview:RegisterBtn];
    
    UIView *regBorder = [[UIView alloc] initWithFrame:CGRectMake(0, 284, bottomHolder.frame.size.width, 3)];
    regBorder.backgroundColor = [UIColor colorWithRed:186.0f/255.0f
                                                green:101.0f/255.0f
                                                 blue:30.0f/255.0f
                                                alpha:1.0f];
    [bottomHolder addSubview:regBorder];
    
    /*add header last so everything slides behind it*/
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
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    BackBtn.imageEdgeInsets = UIEdgeInsetsMake(1, 0, 0, spacing);
    BackBtn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [translucentheader addSubview:BackBtn];
    
    UILabel *headerlabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 20, 200, 40)];
    headerlabel.text = @"REGISTER";
    headerlabel.textColor = [UIColor blackColor];
    headerlabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
    headerlabel.textAlignment = NSTextAlignmentCenter;
    [translucentheader addSubview:headerlabel];
    [self.view addSubview:translucentheader];
    
    /*[self.view addSubview:FirstName];
    [self.view addSubview:LastName];
    [self.view addSubview:UserEmail];
    [self.view addSubview:UserPass];
    [self.view addSubview:ZipCode];
    [self.view addSubview:RegisterBtn];*/
    
}

- (IBAction)MaleTouchHandler:(id)sender {
    [maleBtn setImage:[self imageWithImage:[UIImage imageNamed:@"Ellipse-Green.png"] scaledToSize:CGSizeMake(14,14)] forState:UIControlStateNormal];
    [femaleBtn setImage:[self imageWithImage:[UIImage imageNamed:@"Ellipse.png"] scaledToSize:CGSizeMake(14,14)] forState:UIControlStateNormal];
    maleClicked = YES;
    femaleClicked = NO;
}

- (IBAction)FemaleTouchHandler:(id)sender {
    [femaleBtn setImage:[self imageWithImage:[UIImage imageNamed:@"Ellipse-Green.png"] scaledToSize:CGSizeMake(14,14)] forState:UIControlStateNormal];
    [maleBtn setImage:[self imageWithImage:[UIImage imageNamed:@"Ellipse.png"] scaledToSize:CGSizeMake(14,14)] forState:UIControlStateNormal];
    maleClicked = NO;
    femaleClicked = YES;
}

- (IBAction)SignUpClicked:(id)sender {
    NSString *firstname = FirstName.text;
    NSString *lastname = LastName.text;
    NSString *usrpass = UserPass.text;
    NSString *usremail = UserEmail.text;
    
    if (maleClicked == YES){
        NSLog(@"user is male");
        gender = @"Male";
    }
    else if (femaleClicked == YES){
        NSLog(@"user is female");
        gender = @"Female";
    }
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    
    [indicator startAnimating];
    PFUser *user = [PFUser user];
    user.username = usremail;
    user.password = usrpass;
    user.email = usremail;
    
    // other fields can be set just like with PFObject
    user[@"firstname"] = firstname;
    user[@"lastname"] = lastname;
    user[@"gender"] = gender;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            [indicator stopAnimating];
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
            HomeViewController *hview = [storyboard instantiateViewControllerWithIdentifier:@"homeview"];
            //[self.navigationController pushViewController:hview animated:YES];
            [self presentViewController:hview animated:YES completion:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
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

-(void)textFieldDidBeginEditing:(UITextField *)textField {
        [UIView animateWithDuration:0.2 delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             topHolder.alpha = 0.0f;
                             contentHolder.frame = CGRectMake(0, -10, self.view.frame.size.width, 370);
                         }
                         completion:nil];
}

- (IBAction)textFieldFinished:(id)sender
{
    // [sender resignFirstResponder];
    [UIView animateWithDuration:0.3 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         topHolder.alpha = 1.0f;
                         contentHolder.frame = CGRectMake(0, 80, self.view.frame.size.width, 370);
                     }
                     completion:nil];
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
