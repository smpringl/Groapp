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
#import "HomeViewController.h"

@interface LandingViewController ()

@end

@implementation LandingViewController
BOOL frameOneShowing = YES;
BOOL frameTwoShowing = NO;
BOOL frameThreeShowing = NO;
BOOL frameFourShowing = NO;
@synthesize backgroundview, opblack, logo, contentHolder, LoginBtn, RegisterBtn, pageMessage, tutorialContainer;

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
    
    if ([PFUser currentUser]) // Check if user is already logged in or cached
    {
        NSLog(@"is a current user");
        // Push the home view controller without animation
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
        HomeViewController *hview = [storyboard instantiateViewControllerWithIdentifier:@"homeview"];
        [self.navigationController pushViewController:hview animated:YES];
    }
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    // Do any additional setup after loading the view.
    
    backgroundview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    backgroundview.image = [UIImage imageNamed:(@"Login_Screen_bg.png")];
    backgroundview.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:backgroundview];
    
    opblack = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backgroundview.frame.size.width, backgroundview.frame.size.height)];
    opblack.backgroundColor = [UIColor blackColor];
    opblack.alpha = 0.05;
    [backgroundview addSubview:opblack];
    
    logo = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-175)/2, 30, 175, 106)];
    logo.image = [UIImage imageNamed:(@"UrbnEarth_Login_Screen_Logo_NoWords.png")];
    logo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:logo];
    
    pageMessage = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, 136, 300, 25)];
    pageMessage.text = @"GOOD THINGS ARE GROWING";
    pageMessage.textColor = [UIColor whiteColor];
    pageMessage.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    pageMessage.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:pageMessage];
    
    LoginBtn = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, self.view.frame.size.height-65, 130, 45)];
    [LoginBtn setTitle:@"LOGIN" forState:UIControlStateNormal];
    [LoginBtn addTarget:self action:@selector(LoginBtnTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    //[LoginBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    LoginBtn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0];
    //LoginBtn.layer.cornerRadius = 8.0f;
    [LoginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [LoginBtn setBackgroundColor:[UIColor colorWithRed:158.0f/255.0f
                                                   green:204.0f/255.0f
                                                    blue:59.0f/255.0f
                                                   alpha:1.0f]];
    [self.view addSubview:LoginBtn];
    
    
    UIView *loginBorder = [[UIView alloc] initWithFrame:CGRectMake(0, LoginBtn.frame.size.height-3, LoginBtn.frame.size.width, 3)];
    loginBorder.backgroundColor = [UIColor colorWithRed:132.0f/255.0f
                                                  green:170.0f/255.0f
                                                   blue:49.0f/255.0f
                                                  alpha:1.0f];
    [LoginBtn addSubview:loginBorder];
    
    RegisterBtn = [[UIButton alloc] initWithFrame:CGRectMake(((self.view.frame.size.width-280)/2)+150, self.view.frame.size.height-65, 130, 45)];
    [RegisterBtn setTitle:@"REGISTER" forState:UIControlStateNormal];
    [RegisterBtn addTarget:self action:@selector(RegisterBtnTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    //[RegisterBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    RegisterBtn.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14.0];
    //LoginBtn.layer.cornerRadius = 8.0f;
    [RegisterBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RegisterBtn setBackgroundColor:[UIColor colorWithRed:77.0f/255.0f
                                                 green:164.0f/255.0f
                                                  blue:218.0f/255.0f
                                                 alpha:1.0f]];
    [self.view addSubview:RegisterBtn];
    
    UIView *registerBorder = [[UIView alloc] initWithFrame:CGRectMake(0, RegisterBtn.frame.size.height-3, RegisterBtn.frame.size.width, 3)];
    registerBorder.backgroundColor = [UIColor colorWithRed:58.0f/255.0f
                                                  green:127.0f/255.0f
                                                   blue:169.0f/255.0f
                                                  alpha:1.0f];
    [RegisterBtn addSubview:registerBorder];
    
    tutorialContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 175, (self.view.frame.size.width*4), 200)];
    [self.view addSubview:tutorialContainer];
    
    UIView *tviewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    tviewOne.backgroundColor = [UIColor blueColor];
    [tutorialContainer addSubview:tviewOne];
    
    UIView *tviewTwo = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    tviewTwo.backgroundColor = [UIColor greenColor];
    [tutorialContainer addSubview:tviewTwo];
    
    UIView *tviewThree = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width)*2, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    tviewThree.backgroundColor = [UIColor redColor];
    [tutorialContainer addSubview:tviewThree];
    
    UIView *tviewFour = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width)*3, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    tviewFour.backgroundColor = [UIColor yellowColor];
    [tutorialContainer addSubview:tviewFour];
    
    tutorialContainer.userInteractionEnabled = YES;
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [tutorialContainer addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [tutorialContainer addGestureRecognizer:swipeLeft];
    
    [self frameShiftOne];
}

-(void)frameShiftOne {
    [UIView animateWithDuration:0.2 delay:4.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         tutorialContainer.frame = CGRectMake(-(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                     }
                     completion:^(BOOL finished) {
                         [self frameShiftTwo];
                     }];
}

-(void)frameShiftTwo {
    [UIView animateWithDuration:0.2 delay:4.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         tutorialContainer.frame = CGRectMake(-2*(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                     }
                     completion:^(BOOL finished) {
                         [self frameShiftThree];
                     }];
}

-(void)frameShiftThree {
    [UIView animateWithDuration:0.2 delay:4.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         tutorialContainer.frame = CGRectMake(-3*(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                     }
                     completion:^(BOOL finished) {
                         [self frameShiftFour];
                     }];
}

-(void)frameShiftFour {
    [UIView animateWithDuration:0.5 delay:4.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         tutorialContainer.frame = CGRectMake(0, 175, self.view.frame.size.width*4, 200);
                     }
                     completion:^(BOOL finished) {
                         [self frameShiftOne];
                     }];
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture
{
    
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swiped right");
        if (frameOneShowing == NO) {
            if (frameTwoShowing == YES){
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     tutorialContainer.frame = CGRectMake(0, 175, self.view.frame.size.width*4, 200);
                                 }];
                frameOneShowing = YES;
                frameTwoShowing = NO;
                [self frameShiftOne];
            }
            else if (frameThreeShowing == YES) {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     tutorialContainer.frame = CGRectMake(-(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                                 }];
                frameTwoShowing = YES;
                frameThreeShowing = NO;
                [self frameShiftTwo];
            }
            else if (frameFourShowing) {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     tutorialContainer.frame = CGRectMake(-2*(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                                 }];
                frameThreeShowing = YES;
                frameFourShowing = NO;
                [self frameShiftThree];
            }
        }
        else {
            //do nothing
        }
    }
    else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swiped left");
        if (frameFourShowing == NO) {
            if (frameOneShowing == YES){
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     tutorialContainer.frame = CGRectMake(-(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                                 }];
                frameTwoShowing = YES;
                frameOneShowing = NO;
                [self frameShiftTwo];
            }
            else if (frameTwoShowing == YES) {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     tutorialContainer.frame = CGRectMake(-2*(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                                 }];
                frameThreeShowing = YES;
                frameTwoShowing = NO;
                [self frameShiftThree];
            }
            else if (frameThreeShowing == YES) {
                [UIView animateWithDuration:0.3
                                 animations:^{
                                     tutorialContainer.frame = CGRectMake(-3*(self.view.frame.size.width), 175, self.view.frame.size.width*4, 200);
                                 }];
                frameFourShowing = YES;
                frameThreeShowing = NO;
                [self frameShiftFour];
            }
        }
        else {
            //do nothing
        }
    }
    else
        NSLog(@"Unrecognized swipe direction");
    
    // Now animate the changing of the frame
    
    /*[UIView animateWithDuration:0.5
                     animations:^{
                         self.gridView.frame = frame;
                     }];*/
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
