//
//  ViewController.m
//  TouchesDemo
//
//  Created by Makzan on 4/8/12.
//  Copyright (c) 2012 42games. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    BOOL isDragging;
}


@synthesize coordLabel;
@synthesize box;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)viewDidUnload
{
    [self setCoordLabel:nil];
    [self setBox:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    coordLabel.text = [NSString stringWithFormat:@"(%.0f, %.0f)", point.x, point.y];
    
    if (CGRectContainsPoint(box.frame, point))
    {
        float boxWidth = self.box.frame.size.width;
        float boxHeight = self.box.frame.size.height;
        box.frame = CGRectMake(point.x - boxWidth/2, point.y - boxHeight/2, boxWidth, boxHeight);
        
        isDragging = YES;
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    coordLabel.text = [NSString stringWithFormat:@"(%.0f, %.0f)", point.x, point.y];
    
    if (isDragging)
    {
        float boxWidth = self.box.frame.size.width;
        float boxHeight = self.box.frame.size.height;
        box.frame = CGRectMake(point.x - boxWidth/2, point.y - boxHeight/2, boxWidth, boxHeight);
    }
    

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    isDragging = NO;
}



















@end
