//
//  AboutViewController.m
//  WebViewDemo
//
//  Created by Seng Hin Mak on 6/7/12.
//  Copyright (c) 2012 42games ltd. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController
@synthesize webview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURL *aboutURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"]isDirectory:NO];
    
//    NSURL *websiteURL = [NSURL URLWithString:@"http://www.navicake.com/about"];
    
    [self.webview loadRequest:[NSURLRequest requestWithURL:aboutURL]];
}

- (void)viewDidUnload
{
    [self setWebview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)tappedDone:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}



@end
