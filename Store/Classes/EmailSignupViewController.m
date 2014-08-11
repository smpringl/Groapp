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
@synthesize FullName, UserEmail, UserPass, ZipCode;

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
   [self.FullName setDelegate:self];
    [self.FullName setReturnKeyType:UIReturnKeyDone];
    [self.FullName addTarget:self
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

- (IBAction)SignUpClicked:(id)sender {
    NSString *usrname = FullName.text;
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
    user.username = usrname;
    user.password = usrpass;
    user.email = usremail;
    
    // other fields can be set just like with PFObject
    user[@"ZipCode"] = zcode;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
            [indicator stopAnimating];
            
            [self.navigationController pushViewController:
             [HomeViewController alloc] animated:NO];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
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
