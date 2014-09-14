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

@end
