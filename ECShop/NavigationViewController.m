//
//  NavigationViewController.m
//
//  Created by e_business 15/03/23.
//

#import "NavigationViewController.h"
#import "CategoryViewController.h"
#import "BarcodeViewController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "AKTabBarController.h"

@interface NavigationViewController () <REMenuDelegate>

@property (strong, readwrite, nonatomic) REMenu *menu;

@end

@implementation NavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (REUIKitIsFlatMode()) {
        [self.navigationBar performSelector:@selector(setBarTintColor:) withObject:[UIColor colorWithRed:0/255.0 green:220/255.0 blue:240/255.0 alpha:0.8]];
        self.navigationBar.tintColor = [UIColor whiteColor];
    } else {
        self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
    }
    
    __typeof (self) __weak weakSelf = self;
    REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"分类"
                                                    subtitle:@"显示产品所有分类"
                                                       image:[UIImage imageNamed:@"Icon_Home"]
                                            highlightedImage:nil
                                                      action:^(REMenuItem *item) {
                                                          NSLog(@"Item: %@", item);
                                                          CategoryViewController *controller = [[CategoryViewController alloc] init];
                                                          [weakSelf pushViewController:controller animated:false];}];
    REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"抢购"
                                                       subtitle:@"特价商品快速抢购"
                                                          image:[UIImage imageNamed:@"Icon_Explore"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             CategoryViewController *controller = [[CategoryViewController alloc] init];
                                                             [weakSelf pushViewController:controller animated:false];}];
    
    REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"团购"
                                                        subtitle:@"一起团购更便宜"
                                                           image:[UIImage imageNamed:@"Icon_Activity"]
                                                highlightedImage:nil
                                                          action:^(REMenuItem *item) {
                                                              NSLog(@"Item: %@", item);
                                                              CategoryViewController *controller = [[CategoryViewController alloc] init];
                                                              [weakSelf pushViewController:controller animated:false];}];
    
    
    REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"条形码"
                                                        subtitle:@"打开条形码扫描器"
                                                          image:[UIImage imageNamed:@"Icon_Profile"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                             NSLog(@"Item: %@", item);
                                                             CategoryViewController *controller = [[CategoryViewController alloc] init];
                                                             [weakSelf pushViewController:controller animated:false];}];
    
    homeItem.tag = 0;
    exploreItem.tag = 1;
    activityItem.tag = 2;
    profileItem.tag = 3;
    
    self.menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem]];
    
    if (!REUIKitIsFlatMode()) {
        self.menu.cornerRadius = 4;
        self.menu.shadowRadius = 4;
        self.menu.shadowColor = [UIColor blackColor];
        self.menu.shadowOffset = CGSizeMake(0, 1);
        self.menu.shadowOpacity = 1;
    }

    self.menu.separatorOffset = CGSizeMake(15.0, 0.0);
    self.menu.imageOffset = CGSizeMake(5, -1);
    self.menu.waitUntilAnimationIsComplete = NO;
    self.menu.badgeLabelConfigurationBlock = ^(UILabel *badgeLabel, REMenuItem *item) {
        badgeLabel.backgroundColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
        badgeLabel.layer.borderColor = [UIColor colorWithRed:0.000 green:0.648 blue:0.507 alpha:1.000].CGColor;
    };
    self.menu.delegate = self;
    
    
    [self.menu setClosePreparationBlock:^{
        NSLog(@"Menu will close");
    }];
    
    [self.menu setCloseCompletionHandler:^{
        NSLog(@"Menu did close");
    }];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self popToRootViewControllerAnimated:false];
    
}

- (void)toggleMenu
{
    if (self.menu.isOpen)
        return [self.menu close];
    
    [self.menu showFromNavigationController:self];
}

- (void)barcodeScan
{
    NSLog(@"ddd");
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[NavigationViewController alloc] initWithRootViewController:[[BarcodeViewController alloc] init]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    
    
    
}

- (void)barcodeScanReturn
{
    NSLog(@"ddd");
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // If the device is an iPad, we make it taller.
    _tabController = [[AKTabBarController alloc] initWithTabBarHeight:(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 70 : 50];
    [_tabController setMinimumHeightToDisplayTitle:40.0];
    
    UIViewController *firstViewController = [[FirstViewController alloc] init ];
    UIViewController *secondViewController = [[SecondViewController alloc] init];
    UIViewController *thirdViewController = [[ThirdViewController alloc] init];
    UIViewController *fourthViewController = [[FourthViewController alloc] init];
    
    
    UINavigationController *firNavigationController = [[NavigationViewController alloc] initWithRootViewController:firstViewController];
    UINavigationController *secNavigationController = [[NavigationViewController alloc] initWithRootViewController:secondViewController];
    UINavigationController *thiNavigationController = [[NavigationViewController alloc] initWithRootViewController:thirdViewController];
    UINavigationController *fouNavigationController = [[NavigationViewController alloc] initWithRootViewController:fourthViewController];
    
    firNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    secNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    thiNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    fouNavigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    
    [_tabController setViewControllers:[NSMutableArray arrayWithObjects:
                                           firNavigationController,
                                           secNavigationController,
                                           thiNavigationController,
                                           fouNavigationController,nil]];
    
    [_window setRootViewController:_tabController];
    [_window makeKeyAndVisible];
    
}

#pragma mark - REMenu Delegate Methods

-(void)willOpenMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

-(void)didOpenMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

-(void)willCloseMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

-(void)didCloseMenu:(REMenu *)menu
{
    NSLog(@"Delegate method: %@", NSStringFromSelector(_cmd));
}

@end
