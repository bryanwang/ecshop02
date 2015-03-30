//
//  AppDelegate.m
//
//  Created by e_business 15/03/23.
//

#import "AppDelegate.h"
#import "AKTabBarController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "NavigationViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // If the device is an iPad, we make it taller.
    _tabBarController = [[AKTabBarController alloc] initWithTabBarHeight:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 70 : 50];
    [_tabBarController setMinimumHeightToDisplayTitle:40.0];
    
    UIViewController *firstViewController = [[FirstViewController alloc] init ];
    UIViewController *secondViewController = [[SecondViewController alloc] init];
    UIViewController *thirdViewController = [[ThirdViewController alloc] init];
    UIViewController *fourthViewController = [[FourthViewController alloc] init];
    
    
    NavigationViewController *firNavigationController = [[NavigationViewController alloc] initWithRootViewController:firstViewController];
    firNavigationController.tabController = _tabBarController;
    
    UINavigationController *secNavigationController = [[NavigationViewController alloc] initWithRootViewController:secondViewController];
    UINavigationController *thiNavigationController = [[NavigationViewController alloc] initWithRootViewController:thirdViewController];
    UINavigationController *fouNavigationController = [[NavigationViewController alloc] initWithRootViewController:fourthViewController];
    
    firNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    secNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    thiNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    fouNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    
    [_tabBarController setViewControllers:[NSMutableArray arrayWithObjects:
                                               firNavigationController,
                                               secNavigationController,
                                               thiNavigationController,
                                               fouNavigationController,nil]];
    
    
    
    [_window setRootViewController:_tabBarController];
    [_window makeKeyAndVisible];
    return YES;
}

@end
