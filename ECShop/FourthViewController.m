//
//  FourthViewController.m
//
//  Created by e_business 15/03/23.
//

#import "FourthViewController.h"

@interface FourthViewController ()


@end

@implementation FourthViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"购物车";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    
    NSLog( @"%f", width );
    NSLog( @"%f", height );
    
    
    
    
    
    if (height == 480) {
        
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 425 )];
        
    } else{
        
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 515 )];
    }
    
    
    [webView setScalesPageToFit:YES];
    [self.view addSubview:webView];
    [webView setScalesPageToFit:YES];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.11.99/tinyshop/cart-s.html"]];
    [webView loadRequest:request];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.11.99/tinyshop/cart-s.html"]];
    [webView loadRequest:request];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (NSString *)tabImageName
{
    return @"image-4";
}



@end
