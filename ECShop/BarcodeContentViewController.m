//
//  BarcodeContentViewController.m
//
//  Created by e_business 15/03/23.
//

#import "BarcodeContentViewController.h"
#import "NavigationViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@interface BarcodeContentViewController ()

@end

@implementation BarcodeContentViewController

- (NSString *)tabTitle
{
    return self.title;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage* rightButton=[UIImage imageNamed:@"image-1.png"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightButton style:UIBarButtonItemStyleBordered target:self.navigationController action:@selector(barcodeScanReturn)];
    
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
