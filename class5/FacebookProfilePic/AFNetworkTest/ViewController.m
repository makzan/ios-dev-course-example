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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSURL *imageURL = [NSURL URLWithString:@"http://graph.facebook.com/makzan/picture?type=large"];
    [networkImageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"loading.png"]];
    
    NSURL *url = [NSURL URLWithString:@"http://graph.facebook.com/makzan"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Result: %@", JSON);
        nameLabel.text = [JSON objectForKey:@"name"];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // Handle error here.
    }];
    
    [operation start];
    
}

- (void)viewDidUnload
{
    [self setNetworkImageView:nil];
    [self setNameLabel:nil];
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
    [super dealloc];
}
@end
