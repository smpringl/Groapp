//
//  TimerViewController.h
//  UrbnEarth
//
//  Created by Trey Pringle on 9/14/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController {
    
    NSTimer *timer;
    IBOutlet UILabel *myCounterLabel;
}

@property (nonatomic, retain) UILabel *myCounterLabel;
-(void)updateCounter:(NSTimer *)theTimer;
-(void)countdownTimer;

@property (strong, nonatomic) IBOutlet UIButton *offBtn;
@property (strong, nonatomic) IBOutlet UIButton *fiveMinBtn;
@property (strong, nonatomic) IBOutlet UIButton *tenMinBtn;

@end
