//
//  ViewController.m
//  Gesture
//
//  Created by Freshman on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize button;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureHandler:)];
    tapGesture.numberOfTapsRequired = 1;
    [button addGestureRecognizer:tapGesture];
    
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressHandler:)];
    [button addGestureRecognizer:longPressGesture];
    
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureHandler:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGesture];
    
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureHandler:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
    [self.view addGestureRecognizer:panGesture];
    
}

- (void)tapGestureHandler:(UIGestureRecognizer*)gestureRecognizer
{
    NSLog(@"Tap Gesture Triggered. %d fingers tapped.", gestureRecognizer.numberOfTouches);
}

- (void)longPressHandler:(UIGestureRecognizer*)gestureRecognizer
{
    NSLog(@"Long pressed.");
}

- (void)swipeGestureHandler:(UIGestureRecognizer*)gestureRecognizer
{
    NSLog(@"Swiped");
}

- (void)rotationGestureHandler:(UIRotationGestureRecognizer*)gestureRecognizer
{
    float degree = gestureRecognizer.rotation * 180 / M_PI;
    NSLog(@"Rotating: %fdeg", degree);
}

- (void)panGestureHandler:(UIPanGestureRecognizer*)gestureRecognizer
{
    NSLog(@"translation: %@, velocity: %@", NSStringFromCGPoint([gestureRecognizer translationInView:self.view]), NSStringFromCGPoint([gestureRecognizer velocityInView:self.view]));
}

- (void)viewDidUnload
{
    [self setButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [button release];
    [super dealloc];
}
@end
