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
    
    NSURL *url = [NSURL URLWithString:@"http://graph.facebook.com/197007270362369/photos"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];    
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"%@", JSON);
        NSArray *images = [JSON objectForKey:@"data"];
        
        int count = [images count];
        
        for (int i=0; i<count; i++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
            
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            
            NSString *imagePath = [[images objectAtIndex:i] objectForKey:@"source"];
            
            NSLog(@"Loading image: %@", imagePath);
            
            NSURL *imageURL = [NSURL URLWithString:imagePath];
            
            [imageView setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"loading.png"]];
            [scrollview addSubview:imageView];
            
            [imageView setX:320 * i andY:0];
        }
        
        [scrollview setContentSize:CGSizeMake(320*count, 460)];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // error handling
    }];
    [operation start];
    

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

- (void)dealloc {
    [scrollview release];
    [super dealloc];
}
@end
