//
//  BarcodeViewController.m
//
//  Created by e_business 15/03/23.
//

#import "BarcodeViewController.h"

@interface BarcodeViewController ()


@end

@implementation BarcodeViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"条形码扫描";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    [self presentModalViewController:picker animated:YES];//进入照相界面
    
}

- (void)viewWillDisappear:(BOOL)animated {
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
}

- (NSString *)tabImageName
{
    return @"image-1";
}


@end
