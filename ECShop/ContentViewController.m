//
//  ContentViewController.m
//
//  Created by e_business 15/03/23.
//

#import "ContentViewController.h"
#import "NavigationViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

- (NSString *)tabTitle
{
	return self.title;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* leftButton=[UIImage imageNamed:@"image-3.png"];
    UIImage* rightButton=[UIImage imageNamed:@"image-4.png"];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftButton style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(toggleMenu)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightButton style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(barcodeScan)];
    
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NavigationViewController *navigationController = (NavigationViewController *)self.navigationController;
    [navigationController.menu setNeedsLayout];
}




- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
