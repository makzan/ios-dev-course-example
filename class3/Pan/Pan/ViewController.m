//
//  ViewController.m
//  Pan
//
//  Created by Freshman on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize bgView;
@synthesize fgView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
    [fgView addGestureRecognizer:panGesture];
}

- (void)panGestureHandler:(UIPanGestureRecognizer*)gesture
{
    CGPoint translation = [gesture translationInView:self.view];
    NSLog(@"%@", NSStringFromCGPoint(translation));
    
    CGRect frame = fgView.frame;
    
    // gesture ended.
    if (gesture.state == UIGestureRecognizerStateEnded)
    {
        frame.origin.x = 0;
    }else {
        frame.origin.x = frame.origin.x + translation.x;
    }
    
    // transform the frame.
    fgView.frame = frame;
    
    [gesture setTranslation:CGPointZero inView:self.view];
}



- (void)viewDidUnload
{
    [self setBgView:nil];
    [self setFgView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
