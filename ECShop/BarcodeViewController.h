//
//  BarcodeViewController.h
//
//  Created by e_business 15/03/23.
//

#import "BarcodeContentViewController.h"
#import "REMenu.h"

@interface BarcodeViewController : BarcodeContentViewController <UIWebViewDelegate> {
    
    UIWebView *webView;
}


@end