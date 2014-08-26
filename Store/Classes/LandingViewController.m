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
BOOL userSwiped = NO;
@synthesize backgroundview, opblack, logo, contentHolder, LoginBtn, RegisterBtn, tutorialContainer, dotOne, dotTwo, dotThree, dotFour;

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
    
    UIView *dotholder = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-70)/2, self.view.frame.size.height-100, 70, 20)];
    [self.view addSubview:dotholder];
    
    dotOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    dotOne.layer.cornerRadius = 5;
    dotOne.backgroundColor = [UIColor whiteColor];
    [dotholder addSubview:dotOne];
    
    dotTwo = [[UIView alloc] initWithFrame:CGRectMake(20, 0, 10, 10)];
    dotTwo.layer.cornerRadius = 5;
    dotTwo.backgroundColor = [UIColor whiteColor];
    dotTwo.alpha = 0.5;
    [dotholder addSubview:dotTwo];
    
    dotThree = [[UIView alloc] initWithFrame:CGRectMake(40, 0, 10, 10)];
    dotThree.layer.cornerRadius = 5;
    dotThree.backgroundColor = [UIColor whiteColor];
    dotThree.alpha = 0.5;
    [dotholder addSubview:dotThree];
    
    dotFour = [[UIView alloc] initWithFrame:CGRectMake(60, 0, 10, 10)];
    dotFour.layer.cornerRadius = 5;
    dotFour.backgroundColor = [UIColor whiteColor];
    dotFour.alpha = 0.5;
    [dotholder addSubview:dotFour];
    
    
    tutorialContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 131, (self.view.frame.size.width*4), 225)];
    [self.view addSubview:tutorialContainer];
    
    UIView *tviewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    //tviewOne.backgroundColor = [UIColor blueColor];
    [tutorialContainer addSubview:tviewOne];
    
    UILabel *logmessage = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, 0, 280, 35)];
    logmessage.text = @"GOOD THINGS ARE GROWING";
    logmessage.textColor = [UIColor whiteColor];
    logmessage.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    logmessage.textAlignment = NSTextAlignmentCenter;
    [tviewOne addSubview:logmessage];
    
    UIView *tviewTwo = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    //tviewTwo.backgroundColor = [UIColor greenColor];
    [tutorialContainer addSubview:tviewTwo];
    
    UILabel *logmessageTwo = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, 0, 280, 35)];
    logmessageTwo.text = @"MESSAGE TWO";
    logmessageTwo.textColor = [UIColor whiteColor];
    logmessageTwo.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    logmessageTwo.textAlignment = NSTextAlignmentCenter;
    [tviewTwo addSubview:logmessageTwo];
    
    UIView *tviewThree = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width)*2, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    //tviewThree.backgroundColor = [UIColor redColor];
    [tutorialContainer addSubview:tviewThree];
    
    UILabel *logmessageThree = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, 0, 280, 35)];
    logmessageThree.text = @"MESSAGE THREE";
    logmessageThree.textColor = [UIColor whiteColor];
    logmessageThree.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    logmessageThree.textAlignment = NSTextAlignmentCenter;
    [tviewThree addSubview:logmessageThree];
    
    UIView *tviewFour = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width)*3, 0, self.view.frame.size.width, tutorialContainer.frame.size.height)];
    //tviewFour.backgroundColor = [UIColor yellowColor];
    [tutorialContainer addSubview:tviewFour];
    
    UILabel *logmessageFour = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-280)/2, 0, 280, 35)];
    logmessageFour.text = @"MESSAGE FOUR";
    logmessageFour.textColor = [UIColor whiteColor];
    logmessageFour.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    logmessageFour.textAlignment = NSTextAlignmentCenter;
    [tviewFour addSubview:logmessageFour];
    
    tutorialContainer.userInteractionEnabled = YES;
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [tutorialContainer addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [tutorialContainer addGestureRecognizer:swipeLeft];
    
    //auto shifting initializer turned off
    [self frameShiftOne];
}

//for auto shifting -- not working with swipe recognizer

-(void)frameShiftOne {
    [UIView animateWithDuration:0.2 delay:4.0
                        options:(UIViewAnimationOptionAllowUserInteraction |
                                 UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                         tutorialContainer.frame = CGRectMake(-(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                         dotOne.alpha = 0.5;
                         dotTwo.alpha = 1;
                         
                     }
                     completion:^(BOOL finished) {
                         [self handleFrames];
                     }];
}

-(void)frameShiftTwo {
    [UIView animateWithDuration:0.2 delay:4.0
                        options:(UIViewAnimationOptionAllowUserInteraction |
                                 UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                         tutorialContainer.frame = CGRectMake(-2*(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                         dotTwo.alpha = 0.5;
                         dotThree.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [self handleFrames];
                     }];
}

-(void)frameShiftThree {
    [UIView animateWithDuration:0.2 delay:4.0
                        options:(UIViewAnimationOptionAllowUserInteraction |
                                 UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                         tutorialContainer.frame = CGRectMake(-3*(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                         dotThree.alpha = 0.5;
                         dotFour.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [self handleFrames];
                     }];
}

-(void)frameShiftFour {
    [UIView animateWithDuration:0.5 delay:4.0
                        options:(UIViewAnimationOptionAllowUserInteraction |
                                 UIViewAnimationOptionCurveEaseInOut)
                     animations:^{
                         tutorialContainer.frame = CGRectMake(0, 131, self.view.frame.size.width*4, 205);
                         dotFour.alpha = 0.5;
                         dotOne.alpha = 1;
                     }
                     completion:^(BOOL finished) {
                         [self handleFrames];
                     }];
}

-(void)handleFrames {
    if (userSwiped == NO){
        if (tutorialContainer.frame.origin.x == 0){
            [self frameShiftOne];
        }
        else if (tutorialContainer.frame.origin.x == -(self.view.frame.size.width)) {
            [self frameShiftTwo];
        }
        else if (tutorialContainer.frame.origin.x == -2*(self.view.frame.size.width)) {
            [self frameShiftThree];
        }
        else if (tutorialContainer.frame.origin.x == -3*(self.view.frame.size.width)) {
            [self frameShiftFour];
        }
    }
    else {
        //do nothing
    }
}

- (void)handleSwipe:(UISwipeGestureRecognizer *)gesture
{
    
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"swiped right");
        userSwiped = YES;
        if (tutorialContainer.frame.origin.x == 0){
            //do nothing
        }
        else if (tutorialContainer.frame.origin.x == -(self.view.frame.size.width)) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 tutorialContainer.frame = CGRectMake(0, 131, self.view.frame.size.width*4, 205);
                                 dotOne.alpha = 1;
                                 dotTwo.alpha = 0.5;
                                 dotThree.alpha = 0.5;
                                 dotFour.alpha = 0.5;
                             }];
        }
        else if (tutorialContainer.frame.origin.x == -2*(self.view.frame.size.width)) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 tutorialContainer.frame = CGRectMake(-(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                                 dotOne.alpha = 0.5;
                                 dotTwo.alpha = 1;
                                 dotThree.alpha = 0.5;
                                 dotFour.alpha = 0.5;
                             }];
        }
        else if (tutorialContainer.frame.origin.x == -3*(self.view.frame.size.width)) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 tutorialContainer.frame = CGRectMake(-2*(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                                 dotOne.alpha = 0.5;
                                 dotTwo.alpha = 0.5;
                                 dotThree.alpha = 1;
                                 dotFour.alpha = 0.5;
                             }];
        }
    }
    else if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"swiped left");
        userSwiped = YES;
        if (tutorialContainer.frame.origin.x == 0){
            [UIView animateWithDuration:0.3
                             animations:^{
                                 tutorialContainer.frame = CGRectMake(-(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                                 dotOne.alpha = 0.5;
                                 dotTwo.alpha = 1;
                                 dotThree.alpha = 0.5;
                                 dotFour.alpha = 0.5;
                             }];
        }
        else if (tutorialContainer.frame.origin.x == -(self.view.frame.size.width)) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 tutorialContainer.frame = CGRectMake(-2*(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                                 dotOne.alpha = 0.5;
                                 dotTwo.alpha = 0.5;
                                 dotThree.alpha = 1;
                                 dotFour.alpha = 0.5;
                             }];
        }
        else if (tutorialContainer.frame.origin.x == -2*(self.view.frame.size.width)) {
            [UIView animateWithDuration:0.3
                             animations:^{
                                 tutorialContainer.frame = CGRectMake(-3*(self.view.frame.size.width), 131, self.view.frame.size.width*4, 205);
                                 dotOne.alpha = 0.5;
                                 dotTwo.alpha = 0.5;
                                 dotThree.alpha = 0.5;
                                 dotFour.alpha = 1;
                             }];
        }
        else if (tutorialContainer.frame.origin.x == -3*(self.view.frame.size.width)) {
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
