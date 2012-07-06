//
//  AboutViewController.h
//  WebViewDemo
//
//  Created by Seng Hin Mak on 6/7/12.
//  Copyright (c) 2012 42games ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIWebView *webview;
- (IBAction)tappedDone:(id)sender;

@end
