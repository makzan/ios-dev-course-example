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
@synthesize networkImageView;
@synthesize nameLabel;
@synthesize scrollview;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
       
    {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        
        NSURL *url = [NSURL URLWithString:@"http://placehold.it/320x460.png"];
        [imageView setImageWithURL:url];
        
        [scrollview addSubview:imageView];
    }
    
    {
        UIImage *img1 = [UIImage imageNamed:@"460-1.jpeg"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img1];
        [scrollview addSubview:imageView];
        [imageView setX:320 andY:0];
    }
    
    {
        UIImage *img1 = [UIImage imageNamed:@"460-1.jpeg"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img1];
        [scrollview addSubview:imageView];
        [imageView setX:320 * 2 andY:0];
    }
    
    {
        UIImage *img1 = [UIImage imageNamed:@"460-1.jpeg"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:img1];
        [scrollview addSubview:imageView];
        [imageView setX:320 * 3 andY:0];
    }
    
    scrollview.contentSize = CGSizeMake(320*4, 400);
    
    scrollview.pagingEnabled = YES;
}

- (void)viewDidUnload
{
    [self setNetworkImageView:nil];
    [self setNameLabel:nil];
    [self setScrollview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [networkImageView release];
    [nameLabel release];
    [scrollview release];
    [super dealloc];
}
@end
