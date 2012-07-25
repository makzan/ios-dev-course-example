//
//  ViewController.m
//  AFNetworkTest
//
//  Created by Freshman on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize networkImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *imageURL = [NSURL URLWithString:@"http://placekitten.com/200/300"];
    [networkImageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"loading.png"]];
}

- (void)viewDidUnload
{
    [self setNetworkImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [networkImageView release];
    [super dealloc];
}
@end
