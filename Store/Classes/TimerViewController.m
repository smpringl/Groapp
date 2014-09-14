//
//  TimerViewController.m
//  UrbnEarth
//
//  Created by Trey Pringle on 9/14/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController
@synthesize myCounterLabel;

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
    myCounterLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:30.0];
    [self.view addSubview:myCounterLabel];
    
    UIView *buttonholder = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-240)/2, self.view.frame.size.height-100, 240, 100)];
    [self.view addSubview:buttonholder];
    
    UIButton *offBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60,60)];
    [offBtn setTitle:@"OFF" forState:UIControlStateNormal];
    [offBtn addTarget:self action:@selector(forgotPasswordTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [offBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]];
    offBtn.layer.cornerRadius = 30.0f;
    [offBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[offBtn layer] setBorderWidth:1.0f];
    [[offBtn layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [buttonholder addSubview:offBtn];
    
    UIButton *fiveMinBtn = [[UIButton alloc] initWithFrame:CGRectMake((buttonholder.frame.size.width/2)-30, 0, 60,60)];
    [fiveMinBtn setTitle:@"5m" forState:UIControlStateNormal];
    [fiveMinBtn addTarget:self action:@selector(forgotPasswordTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
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
    
    UIButton *tenMinBtn = [[UIButton alloc] initWithFrame:CGRectMake(buttonholder.frame.size.width-60, 0, 60,60)];
    [tenMinBtn setTitle:@"10m" forState:UIControlStateNormal];
    [tenMinBtn addTarget:self action:@selector(forgotPasswordTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [tenMinBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]];
    tenMinBtn.layer.cornerRadius = 30.0f;
    [tenMinBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[tenMinBtn layer] setBorderWidth:1.0f];
    [[tenMinBtn layer] setBorderColor:[UIColor lightGrayColor].CGColor];
    [buttonholder addSubview:tenMinBtn];
    
    secondsLeft = 16925;
    [self countdownTimer];
}

- (void)BackTouchHandler:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(secondsLeft > 0 ){
        secondsLeft -- ;
        hours = secondsLeft / 3600;
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft %3600) % 60;
        myCounterLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    }
    else{
        secondsLeft = 16925;
    }
}

-(void)countdownTimer{
    
    secondsLeft = hours = minutes = seconds = 0;
    if([timer isValid])
    {
        //[timer release];
    }
    //NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    //[pool release];
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
