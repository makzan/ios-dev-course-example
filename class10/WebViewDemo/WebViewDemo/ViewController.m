//
//  ViewController.m
//  WebViewDemo
//
//  Created by Seng Hin Mak on 6/7/12.
//  Copyright (c) 2012 42games ltd. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
    
    return YES;
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)tappedAbout:(id)sender {
    AboutViewController *aboutVC = [[AboutViewController alloc] init];
    [self presentModalViewController:aboutVC animated:YES];
}



@end
