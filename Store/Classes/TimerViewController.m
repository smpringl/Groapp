//
//  TimerViewController.m
//  UrbnEarth
//
//  Created by Trey Pringle on 9/14/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import "TimerViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface TimerViewController ()

@end

@implementation TimerViewController
@synthesize myCounterLabel, offBtn, fiveMinBtn, tenMinBtn, introBox;
BOOL timerRunning = NO;
BOOL fiveTimer = YES;
BOOL tenTimer = NO;
BOOL offBtnSelected = NO;
BOOL cancelled = NO;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

int hours, minutes, seconds;
int secondsLeft;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *bgPic = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgPic.image = [UIImage imageNamed:@"Landing-Screen-bg.png"];
    bgPic.contentMode = UIViewContentModeScaleAspectFill;
    bgPic.clipsToBounds = YES;
    [self.view addSubview:bgPic];
    
    UIButton *BackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 40, 40)];
    [BackBtn addTarget:self action:@selector(BackTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [BackBtn setBackgroundColor:[UIColor clearColor]];
    [BackBtn setImage:[self imageWithImage:[UIImage imageNamed:@"backarrow.png"] scaledToSize:CGSizeMake(13,21)] forState:UIControlStateNormal];
    [self.view addSubview:BackBtn];
    
    UILabel *headerlabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 20, 200, 40)];
    headerlabel.text = @"Water Timer";
    headerlabel.textColor = [UIColor blackColor];
    headerlabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18.0];
    headerlabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:headerlabel];
    
    myCounterLabel.textColor = [UIColor whiteColor];
    myCounterLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:40.0];
    [self.view addSubview:myCounterLabel];
    
    UIView *buttonholder = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-240)/2, self.view.frame.size.height-100, 240, 100)];
    [self.view addSubview:buttonholder];
    
    offBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60,60)];
    [offBtn setTitle:@"OFF" forState:UIControlStateNormal];
    [offBtn addTarget:self action:@selector(offBtnTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [offBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]];
    offBtn.layer.cornerRadius = 30.0f;
    [offBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[offBtn layer] setBorderWidth:1.0f];
    [[offBtn layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [buttonholder addSubview:offBtn];
    
    fiveMinBtn = [[UIButton alloc] initWithFrame:CGRectMake((buttonholder.frame.size.width/2)-30, 0, 60,60)];
    [fiveMinBtn setTitle:@"5m" forState:UIControlStateNormal];
    [fiveMinBtn addTarget:self action:@selector(fiveBtnTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [fiveMinBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]];
    fiveMinBtn.layer.cornerRadius = 30.0f;
    [fiveMinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[fiveMinBtn layer] setBorderWidth:1.0f];
    [[fiveMinBtn layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [fiveMinBtn setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f
                                               green:132.0f/255.0f
                                                blue:38.0f/255.0f
                                               alpha:1.0f]];
    [buttonholder addSubview:fiveMinBtn];
    
    tenMinBtn = [[UIButton alloc] initWithFrame:CGRectMake(buttonholder.frame.size.width-60, 0, 60,60)];
    [tenMinBtn setTitle:@"10m" forState:UIControlStateNormal];
    [tenMinBtn addTarget:self action:@selector(tenBtnTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [tenMinBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]];
    tenMinBtn.layer.cornerRadius = 30.0f;
    [tenMinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[tenMinBtn layer] setBorderWidth:1.0f];
    [[tenMinBtn layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [buttonholder addSubview:tenMinBtn];
    
    introBox = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 80, 200, 255)];
    introBox.image = [UIImage imageNamed:@"Popup-Window.png"];
    introBox.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:introBox];
    
}

- (void)BackTouchHandler:(id)sender {
    [timer invalidate];
    timerRunning = NO;
    offBtnSelected = NO;
    tenTimer = NO;
    fiveTimer = YES;
    myCounterLabel.text = @"";
    [self dismissModalViewControllerAnimated:YES];
}

- (void)offBtnTouchHandler:(id)sender {
    [offBtn setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f
                                                  green:132.0f/255.0f
                                                   blue:38.0f/255.0f
                                                  alpha:1.0f]];
    [fiveMinBtn setBackgroundColor:[UIColor clearColor]];
    [tenMinBtn setBackgroundColor:[UIColor clearColor]];
    fiveTimer = NO;
    tenTimer = NO;
    offBtnSelected = YES;
    timerRunning = NO;
    [timer invalidate];
    myCounterLabel.text = @"";
    introBox.alpha = 1.0f;
}

- (void)fiveBtnTouchHandler:(id)sender {
    [fiveMinBtn setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f
                                                   green:132.0f/255.0f
                                                    blue:38.0f/255.0f
                                                   alpha:1.0f]];
    [tenMinBtn setBackgroundColor:[UIColor clearColor]];
    [offBtn setBackgroundColor:[UIColor clearColor]];
    fiveTimer = YES;
    tenTimer = NO;
    offBtnSelected = NO;
}

- (void)tenBtnTouchHandler:(id)sender {
    [tenMinBtn setBackgroundColor:[UIColor colorWithRed:245.0f/255.0f
                                                   green:132.0f/255.0f
                                                    blue:38.0f/255.0f
                                                   alpha:1.0f]];
    [fiveMinBtn setBackgroundColor:[UIColor clearColor]];
    [offBtn setBackgroundColor:[UIColor clearColor]];
    fiveTimer = NO;
    tenTimer = YES;
    offBtnSelected = NO;
}

- (void)updateCounter:(NSTimer *)theTimer {
    if (timerRunning == YES) {
    if(secondsLeft > 0 ){
        secondsLeft -- ;
        //hours = secondsLeft / 3600;
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft %3600) % 60;
        myCounterLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    }
    else{
        timerRunning = NO;
        [timer invalidate];
        
        NSLog(@"Timer Finished!");
        myCounterLabel.text = @"";
        introBox.alpha = 1.0f;
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Timer finished!"
                                                     message:@"Turn of your water"
                                                    delegate:self
                                           cancelButtonTitle:nil
                                           otherButtonTitles:@"OK", nil];
        [av show];
        [self startVibrate];
    }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
        if (buttonIndex == 0)
        {
            cancelled = YES;
            NSLog(@"User Acknowledges Timer End!");
        }
}

-(void)countdownTimer{
    if (offBtnSelected == NO) {
        cancelled = NO;
        if (fiveTimer == YES) {
            secondsLeft = 300;
        }
        else if (tenTimer == YES) {
            secondsLeft = 600;
            
        }
        [UIView animateWithDuration:0.2
                         animations:^{
                             introBox.alpha = 0.0f;
                         }
                         completion:^(BOOL finished) {
                             timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
                         }];
        
    }
    else {
        NSLog(@"Do Nothing!");
    }
}

- (void)startVibrate{
    viber = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(vibrating:) userInfo:nil repeats:YES];
}

- (void)vibrating:(id)sender{
    if (cancelled == NO) {
        AudioServicesPlaySystemSound (1352);
    }
    else if (cancelled == YES) {
        [viber invalidate];
    }
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

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (UIEventSubtypeMotionShake) {
        NSLog(@"I'm shaking!");
        if (timerRunning == NO) {
            if (offBtnSelected == NO) {
            timerRunning = YES;
            [self countdownTimer];
            }
            else {
                NSLog(@"Timer is off!");
            }
        }
        else {
            NSLog(@"Timer Already Running");
        }
    }
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
