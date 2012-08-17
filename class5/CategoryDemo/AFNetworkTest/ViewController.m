//
//  ViewController.m
//  AFNetworkTest
//
//  Created by Freshman on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import "UIImageView+AFNetworking.h"
#import "UIView+Position.h"

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
        
    [networkImageView setX:0 andY:0];
    
    [UIView animateWithDuration:5 animations:^{
        [networkImageView setX:320 andY:480];
    }];
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

@end
