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
#import "AFJSONRequestOperation.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize scrollview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    for (int i=0; i<4; i++)
    {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"320x460.png"]];
        [scrollview addSubview:image];
        
        [image setX:320 * i andY:0];
    }
    
    
    [scrollview setContentSize:CGSizeMake(320*4, 460)];
    
    scrollview.pagingEnabled = YES;
    
}

- (void)viewDidUnload
{
    [self setScrollview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
