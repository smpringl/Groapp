//
//  PFAppDelegate.m
//  Stripe
//
//  Created by Andrew Wang on 2/25/13.
//
#import <Parse/Parse.h>
#import <FacebookSDK/FacebookSDK.h>
#import "PFProductsViewController.h"
#import "PFStoreAppDelegate.h"
#import "Helpshift.h"

@implementation PFStoreAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    [Parse setApplicationId:infoDictionary[@"PARSE_APPLICATION_ID"] clientKey:infoDictionary[@"PARSE_CLIENT_KEY"]];
    
    [PFFacebookUtils initializeFacebook];
    
    [PFTwitterUtils initializeWithConsumerKey:@"nqEqsgEgci4CGaRTaCuFUK1a7"
                               consumerSecret:@"yHSqZ6DyX4bgXsWNCLHLtxwFbk9YvOvlSvV8haK4l0hj0ODgj9"];
    /*self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UINavigationController *rootController = [[UINavigationController alloc] initWithRootViewController:[[PFProductsViewController alloc] init]];
    rootController.navigationBar.hidden = YES;
    self.window.rootViewController = rootController;*/
    
    
    [Helpshift installForApiKey:@"9667f11cc2fbd9f3cdc39deb2a4e4eca" domainName:@"urbnearthtest.helpshift.com" appID:@"urbnearthtest_platform_20140914053527150-0d1f62e2f389254"];
    
    
    return YES;
}

@end
