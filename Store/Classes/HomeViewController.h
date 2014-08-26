//
//  HomeViewController.h
//  UrbnEarth
//
//  Created by Trey Pringle on 8/5/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<NSURLConnectionDelegate> {
    NSMutableData *_imageData;
}

@property (strong, nonatomic) IBOutlet UIView *caseView;
@property (strong, nonatomic) IBOutlet UIImageView *bgPic;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *locLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userPic;
@property (strong, nonatomic) IBOutlet UIView *settingsView;
@property (strong, nonatomic) IBOutlet UIButton *changeBackground;
@property (strong, nonatomic) IBOutlet UIButton *logoutBtn;
@property (strong, nonatomic) IBOutlet UIView *todoContainer;
@property (strong, nonatomic) IBOutlet UIView *todoTop;
@property (strong, nonatomic) IBOutlet UIView *todoBottom;
@property (strong, nonatomic) IBOutlet UITextField *myTask;
@property (strong, nonatomic) NSString *usaname;

@property (strong, nonatomic) UIWindow *storeWindow;
@property (strong, nonatomic) UIView *storeview;

@end
