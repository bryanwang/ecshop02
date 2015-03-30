//
//  NavigationViewController.h
//
//  Created by e_business 15/03/23.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"

@class AKTabBarController;

@interface NavigationViewController : UINavigationController

@property (strong, readonly, nonatomic) REMenu *menu;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AKTabBarController *tabController;

- (void)toggleMenu;

- (void)barcodeScan;
- (void)barcodeScanReturn;

@end
