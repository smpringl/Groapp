//
//  HomeViewController.m
//  UrbnEarth
//
//  Created by Trey Pringle on 8/5/14.
//  Copyright (c) 2014 Parse Inc. All rights reserved.
//

#import "HomeViewController.h"
#import "LandingViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize nameLabel, userPic, bgPic, settingsView, changeBackground, logoutBtn, todoContainer, myTask, todoTop, todoBottom, caseView, locLabel, usaname;

BOOL settingsShowing = NO;

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
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Create request for user's Facebook data
    FBRequest *facebookrequest = [FBRequest requestForMe];
    
    // Send request to Facebook
    [facebookrequest startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // result is a dictionary with the user's Facebook data
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSString *name = userData[@"name"];
            NSString *location = userData[@"location"][@"name"];
            /*NSString *gender = userData[@"gender"];
             NSString *birthday = userData[@"birthday"];
             NSString *relationship = userData[@"relationship_status"];*/
            
            // Download the user's facebook profile picture
            _imageData = [[NSMutableData alloc] init]; // the data will be loaded in here
            
            // URL should point to https://graph.facebook.com/{facebookId}/picture?type=large&return_ssl_resources=1
            NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
            
            NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:pictureURL
                                                                      cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                                  timeoutInterval:2.0f];
            // Run network request asynchronously
            NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
            
            // Now add the data to the UI elements
            // ...
            nameLabel.text = name;
            locLabel.text = location;
           // [self storeFacebookData];
        }
    }];
    
    bgPic = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    bgPic.image = [UIImage imageNamed:@"Landing-Screen-bg.png"];
    bgPic.contentMode = UIViewContentModeScaleAspectFill;
    bgPic.clipsToBounds = YES;
    [self.view addSubview:bgPic];
    
    /*UIView *transCover = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    transCover.backgroundColor = [UIColor blackColor];
    transCover.alpha = 0.7;
    //[self.view addSubview:transCover];
    
    caseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:caseView];
    
    userPic = [[UIImageView alloc] initWithFrame:CGRectMake(((self.view.frame.size.width-150)/2), 70, 150, 150)];
    userPic.contentMode = UIViewContentModeScaleAspectFill;
    userPic.layer.cornerRadius = 75.0f;
    userPic.clipsToBounds = YES;
    [caseView addSubview:userPic];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 220, 300, 60)];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [nameLabel setFont:[UIFont systemFontOfSize:30]];
    [caseView addSubview:nameLabel];
    
    locLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 270, 300, 20)];
    locLabel.textColor = [UIColor grayColor];
    locLabel.textAlignment = NSTextAlignmentCenter;
    [locLabel setFont:[UIFont systemFontOfSize:15]];
    [caseView addSubview:locLabel];
    
    UILabel *rightNow = [[UILabel alloc] initWithFrame:CGRectMake(10, 310, 300, 20)];
    rightNow.textColor = [UIColor whiteColor];
    rightNow.textAlignment = NSTextAlignmentCenter;
    rightNow.text = [NSString stringWithFormat:@"Right now I'm working on:"];
    [rightNow setFont:[UIFont systemFontOfSize:15]];
    [caseView addSubview:rightNow];
    
    UIButton *settings = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-50, 75, 40, 40)];
    [settings addTarget:self action:@selector(showSettings:) forControlEvents:UIControlEventTouchUpInside];
    [settings setImage:[self imageWithImage:[UIImage imageNamed:@"740-gear@2x.png"] scaledToSize:CGSizeMake(24,24)] forState:UIControlStateNormal];
    [self.view addSubview:settings];
    
    
    
    todoContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 350, self.view.frame.size.width, 70)];
    [caseView addSubview:todoContainer];
    
    todoTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, todoContainer.frame.size.width, 1)];
    todoTop.backgroundColor = [UIColor darkGrayColor];
    [todoContainer addSubview:todoTop];
    
    todoBottom = [[UIView alloc] initWithFrame:CGRectMake(0, todoContainer.frame.size.height-1, todoContainer.frame.size.width, 1)];
    todoBottom.backgroundColor = [UIColor darkGrayColor];
    [todoContainer addSubview:todoBottom];
    
    myTask = [[UITextField alloc] initWithFrame:CGRectMake((todoContainer.frame.size.width-300)/2, 0, 300, todoContainer.frame.size.height)];
    myTask.backgroundColor = [UIColor clearColor];
    myTask.borderStyle = UITextBorderStyleRoundedRect;
    myTask.font = [UIFont systemFontOfSize:20];
    [myTask setTextColor:[UIColor grayColor]];
    myTask.textAlignment = NSTextAlignmentCenter;
    myTask.autocorrectionType = UITextAutocorrectionTypeNo;
    myTask.keyboardType = UIKeyboardTypeDefault;
    myTask.returnKeyType = UIReturnKeyDone;
    myTask.clearButtonMode = UITextFieldViewModeWhileEditing;
    myTask.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    myTask.delegate = self;
    [self.myTask addTarget:self
                    action:@selector(textFieldFinished:)
          forControlEvents:UIControlEventEditingDidEndOnExit];
    [todoContainer addSubview:myTask];
    
    UIColor *color = [UIColor grayColor];
    myTask.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"+ Add Task" attributes:@{NSForegroundColorAttributeName: color}];
    
    
    settingsView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 200)];
    settingsView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:settingsView];
    
    changeBackground = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, settingsView.frame.size.width, (settingsView.frame.size.height/2))];
    [changeBackground addTarget:self action:@selector(changeBackground:) forControlEvents:UIControlEventTouchUpInside];
    [changeBackground setTitle:@"Change Background" forState:UIControlStateNormal];
    [changeBackground.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [changeBackground setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [settingsView addSubview:changeBackground];
    
    logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, (settingsView.frame.size.height/2), settingsView.frame.size.width, (settingsView.frame.size.height/2))];
    [logoutBtn addTarget:self action:@selector(userLogout:) forControlEvents:UIControlEventTouchUpInside];
    [logoutBtn setTitle:@"Logout" forState:UIControlStateNormal];
    [logoutBtn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [logoutBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [settingsView addSubview:logoutBtn];
    
    UIView *settingsDivider = [[UIView alloc] initWithFrame:CGRectMake(((settingsView.frame.size.width-250)/2), (settingsView.frame.size.height/2), 250, 1)];
    settingsDivider.backgroundColor = [UIColor darkGrayColor];
    [settingsView addSubview:settingsDivider];*/
    
    UIScrollView *mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    mainView.contentSize = CGSizeMake(self.view.frame.size.width, 800);
    [self.view addSubview:mainView];
    
    UIView *mainHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    mainHeader.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transblack.png"]];
    [self.view addSubview:mainHeader];
    
    UIButton *shopBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-60, 10, 60, 50)];
    [shopBtn setTitle:@"SHOP" forState:UIControlStateNormal];
    [shopBtn addTarget:self action:@selector(sendPasswordTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    [shopBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.0]];
    [shopBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[shopBtn setBackgroundColor:[UIColor grayColor]];
    [mainHeader addSubview:shopBtn];
    
    UIButton *optionsBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 60, 50)];
    [optionsBtn addTarget:self action:@selector(showSettings:) forControlEvents:UIControlEventTouchUpInside];
    [optionsBtn setImage:[self imageWithImage:[UIImage imageNamed:@"listicon.png"] scaledToSize:CGSizeMake(21,15)] forState:UIControlStateNormal];
    optionsBtn.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 0);
    [mainHeader addSubview:optionsBtn];
    
    UIButton *careGuideBtn = [[UIButton alloc] initWithFrame:CGRectMake((mainView.frame.size.width-300)/2, 65, 300, 40)];
    [careGuideBtn setTitle:@"CARE GUIDE" forState:UIControlStateNormal];
    [careGuideBtn addTarget:self action:@selector(sendPasswordTouchHandler:) forControlEvents:UIControlEventTouchUpInside];
    //[careGuideBtn.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.0]];
    [careGuideBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0]];
    [careGuideBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [careGuideBtn setBackgroundColor:[UIColor redColor]];
    careGuideBtn.layer.cornerRadius = 2;
    [mainView addSubview:careGuideBtn];
    
    UIImageView *urbMat = [[UIImageView alloc] initWithFrame:CGRectMake((mainView.frame.size.width-300)/2, 110, 300, 154)];
    urbMat.image = [UIImage imageNamed:@"urbmat.png"];
    urbMat.contentMode = UIViewContentModeScaleAspectFill;
    urbMat.clipsToBounds = YES;
    urbMat.layer.cornerRadius = 2;
    [mainView addSubview:urbMat];
    
    UIView *tileHolder = [[UIView alloc] initWithFrame:CGRectMake((mainView.frame.size.width-300)/2, 269, 300, 400)];
    [mainView addSubview:tileHolder];
    
    UIImageView *tileOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 148, 148)];
    tileOne.image = [UIImage imageNamed:@"tileOne.png"];
    tileOne.contentMode = UIViewContentModeScaleAspectFill;
    tileOne.clipsToBounds = YES;
    tileOne.layer.cornerRadius = 2;
    [tileHolder addSubview:tileOne];
    
    UIImageView *tileTwo = [[UIImageView alloc] initWithFrame:CGRectMake(152, 0, 148, 148)];
    tileTwo.image = [UIImage imageNamed:@"tileTwo.png"];
    tileTwo.contentMode = UIViewContentModeScaleAspectFill;
    tileTwo.clipsToBounds = YES;
    tileTwo.layer.cornerRadius = 2;
    [tileHolder addSubview:tileTwo];
    
    UIImageView *tileThree = [[UIImageView alloc] initWithFrame:CGRectMake(0, 153, 148, 148)];
    tileThree.image = [UIImage imageNamed:@"tileThree.png"];
    tileThree.contentMode = UIViewContentModeScaleAspectFill;
    tileThree.clipsToBounds = YES;
    tileThree.layer.cornerRadius = 2;
    [tileHolder addSubview:tileThree];
    
    UIImageView *tileFour = [[UIImageView alloc] initWithFrame:CGRectMake(152, 153, 148, 148)];
    tileFour.image = [UIImage imageNamed:@"tileFour.png"];
    tileFour.contentMode = UIViewContentModeScaleAspectFill;
    tileFour.clipsToBounds = YES;
    tileFour.layer.cornerRadius = 2;
    [tileHolder addSubview:tileFour];
}


// Called every time a chunk of the data is received
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_imageData appendData:data]; // Build the image
}

// Called when the entire image is finished downloading
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // Set the image in the header imageView
    userPic.image = [UIImage imageWithData:_imageData];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.1 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         caseView.frame = CGRectMake(0, -135, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];
}

- (IBAction)textFieldFinished:(id)sender
{
    // [sender resignFirstResponder];
    if ( [myTask.text length] != 0 ){
        [UIView animateWithDuration:0.3 delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             todoTop.alpha = 0.0f;
                             todoBottom.alpha = 0.0f;
                         }
                         completion:nil];
    }
    else {
        [UIView animateWithDuration:0.3 delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             todoTop.alpha = 1.0f;
                             todoBottom.alpha = 1.0f;
                         }
                         completion:nil];
    }
    [UIView animateWithDuration:0.1 delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         caseView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];
}

-(void)showSettings:(id)sender{
    if (settingsShowing == NO){
        [UIView animateWithDuration:0.3 delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             settingsView.frame = CGRectMake(0, self.view.frame.size.height-200,self.view.frame.size.width, 200);
                             
                         }
                         completion:nil];
        settingsShowing = YES;
    }
    else {
        [UIView animateWithDuration:0.3 delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             settingsView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 200);
                             
                         }
                         completion:nil];
        settingsShowing = NO;
    }
}

-(void)changeBackground:(id)sender{
    /*UIStoryboard *storyBoard = [self storyboard];
     SearchImageViewController *SearchImageViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"SearchImageViewController"];
     [self presentViewController:SearchImageViewController animated:YES completion:nil];*/
    //[self.navigationController pushViewController:
    //[ChangeBGViewController alloc] animated:YES];
}

-(void)userLogout:(id)sender{
    [PFUser logOut]; // Log out
    
    // Return to login page
    //[self.navigationController popToRootViewControllerAnimated:YES];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    LandingViewController *landcontroller = [storyboard instantiateViewControllerWithIdentifier:@"landingview"];
    [self presentViewController:landcontroller animated:YES completion:nil];
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
