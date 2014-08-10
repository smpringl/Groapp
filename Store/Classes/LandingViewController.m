//
//  LandingViewController.m
//  UrbnEarth
//
//  Created by Trey Pringle on 8/10/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import "LandingViewController.h"
#import "LoginViewController.h"
#import "EmailSignupViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController
@synthesize backgroundview, opblack, logo, contentHolder, LoginBtn, RegisterBtn;

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
    // Do any additional setup after loading the view.
    
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
    
    LoginBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/9, self.view.frame.size.height-70, self.view.frame.size.width/3, 50)];
    [LoginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [LoginBtn addTarget:self action:@selector(LoginBtnTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [LoginBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    //LoginBtn.layer.cornerRadius = 8.0f;
    [LoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [LoginBtn setBackgroundColor:[UIColor colorWithRed:29.0f/255.0f
                                                   green:202.0f/255.0f
                                                    blue:255.0f/255.0f
                                                   alpha:1.0f]];
    //[LoginBtn setImage:[self imageWithImage:[UIImage imageNamed:@"485-facebook@2x.png"] scaledToSize:CGSizeMake(15,15)] forState:UIControlStateNormal];
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    //LoginBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    //LoginBtn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [self.view addSubview:LoginBtn];
    
    RegisterBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width/9)*5, self.view.frame.size.height-70, self.view.frame.size.width/3, 50)];
    [RegisterBtn setTitle:@"Register" forState:UIControlStateNormal];
    [RegisterBtn addTarget:self action:@selector(RegisterBtnTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [RegisterBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    //LoginBtn.layer.cornerRadius = 8.0f;
    [RegisterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RegisterBtn setBackgroundColor:[UIColor colorWithRed:29.0f/255.0f
                                                 green:202.0f/255.0f
                                                  blue:255.0f/255.0f
                                                 alpha:1.0f]];
    //[LoginBtn setImage:[self imageWithImage:[UIImage imageNamed:@"485-facebook@2x.png"] scaledToSize:CGSizeMake(15,15)] forState:UIControlStateNormal];
    //CGFloat spacing = 5; // the amount of spacing to appear between image and title
    //LoginBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    //LoginBtn.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
    [self.view addSubview:RegisterBtn];
    
    
}

- (void)LoginBtnTouchHandler:(id)sender {
    //[self.navigationController pushViewController:
    //[EmailSignupViewController alloc] animated:NO];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    LoginViewController *loginviewController = [storyboard instantiateViewControllerWithIdentifier:@"loginview"];
    //[self.navigationController pushViewController:viewController animated:YES];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    [self presentViewController:loginviewController animated:NO completion:nil];
    
    //viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //[self presentViewController:viewController animated:YES completion:nil];
}

- (void)RegisterBtnTouchHandler:(id)sender {
    //[self.navigationController pushViewController:
    //[EmailSignupViewController alloc] animated:NO];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    EmailSignupViewController *emailviewController = [storyboard instantiateViewControllerWithIdentifier:@"emailsignup"];
    //[self.navigationController pushViewController:viewController animated:YES];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    [self presentViewController:emailviewController animated:NO completion:nil];
    
    //viewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    //[self presentViewController:viewController animated:YES completion:nil];
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
