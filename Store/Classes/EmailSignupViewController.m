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
@synthesize FirstName, LastName, UserEmail, UserPass, ZipCode, contentHolder, topHolder, facebookLog, ueUserEmail, ueUserFBID, ueUserFirstName, ueUserLastName, bottomHolder, maleBtn, femaleBtn, fName;

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
   [self.FirstName setDelegate:self];
    [self.FirstName setReturnKeyType:UIReturnKeyDone];
    [self.FirstName addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.LastName setDelegate:self];
    [self.LastName setReturnKeyType:UIReturnKeyDone];
    [self.LastName addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.UserEmail setDelegate:self];
    [self.UserEmail setReturnKeyType:UIReturnKeyDone];
    [self.UserEmail addTarget:self
                      action:@selector(textFieldFinished:)
            forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.UserPass setDelegate:self];
    [self.UserPass setReturnKeyType:UIReturnKeyDone];
    [self.UserPass addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.ZipCode setDelegate:self];
    [self.ZipCode setReturnKeyType:UIReturnKeyDone];
    [self.ZipCode addTarget:self
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
    
    UIView *firstNameHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (bottomHolder.frame.size.width/2)-3, 40)];
    firstNameHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:firstNameHolder];
    
    fName = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, firstNameHolder.frame.size.width-40, 40)];
    [fName setBackgroundColor:[UIColor clearColor]];
    fName.font = [UIFont systemFontOfSize:15];
    fName.placeholder = @"Email";
    fName.autocorrectionType = UITextAutocorrectionTypeNo;
    fName.keyboardType = UIKeyboardTypeDefault;
    fName.returnKeyType = UIReturnKeyDone;
    fName.clearButtonMode = UITextFieldViewModeWhileEditing;
    fName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    fName.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    UIColor *color = [UIColor darkGrayColor];
    fName.attributedPlaceholder =
    [[NSAttributedString alloc] initWithString:@"Email"
                                    attributes:@{
                                                 NSForegroundColorAttributeName: color,
                                                 NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]
                                                 }];
    [self.fName setDelegate:self];
    [fName addTarget:self
                       action:@selector(textFieldFinished:)
             forControlEvents:UIControlEventEditingDidEndOnExit];
    [firstNameHolder addSubview:fName];
    
    UIView *lastNameHolder = [[UIView alloc] initWithFrame:CGRectMake((bottomHolder.frame.size.width/2)+3, 0, (bottomHolder.frame.size.width/2)-3, 40)];
    lastNameHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:lastNameHolder];
    
    UIView *emailHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 46, bottomHolder.frame.size.width, 40)];
    emailHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:emailHolder];
    
    UIView *passwordHolder = [[UIView alloc] initWithFrame:CGRectMake(0, 92, bottomHolder.frame.size.width, 40)];
    passwordHolder.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]];
    [bottomHolder addSubview:passwordHolder];
    
    maleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 138, (bottomHolder.frame.size.width/2)-3, 40)];
    [maleBtn setTitle:@"Male" forState:UIControlStateNormal];
    [maleBtn addTarget:self action:@selector(MaleTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [maleBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]];
    [maleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [maleBtn setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"transwhite.png"]]];
    [maleBtn setImage:[self imageWithImage:[UIImage imageNamed:@"Ellipse.png"] scaledToSize:CGSizeMake(14,14)] forState:UIControlStateNormal];
    maleBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -maleBtn.imageView.frame.size.width, 0, maleBtn.imageView.frame.size.width+60);
    maleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, maleBtn.titleLabel.frame.size.width+60, 0, -maleBtn.titleLabel.frame.size.width);
    [bottomHolder addSubview:maleBtn];
    
    femaleBtn = [[UIButton alloc] initWithFrame:CGRectMake((bottomHolder.frame.size.width/2)+3, 138, (bottomHolder.frame.size.width/2)-3, 40)];
    [femaleBtn setTitle:@"Female" forState:UIControlStateNormal];
    [femaleBtn addTarget:self action:@selector(FemaleTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [femaleBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0]];
    [femaleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
    NSString *zcode = ZipCode.text;
    
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
    user[@"ZipCode"] = zcode;
    
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

- (IBAction)textFieldFinished:(id)sender
{
    // [sender resignFirstResponder];
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
