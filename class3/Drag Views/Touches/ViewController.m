//
//  ViewController.m
//  Touches
//
//  Created by Freshman on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong) UITouch *touchForBox1;
@end

@implementation ViewController {
    UITouch *touchForBox2;
}

@synthesize touchForBox1;

@synthesize coordLabel;
@synthesize box;
@synthesize box2;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setCoordLabel:nil];
    [self setBox:nil];
    [self setBox2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches)
    {
        CGPoint point = [touch locationInView:self.view];
        
        
        
        coordLabel.text = [NSString stringWithFormat:@"(%.2f, %.2f)", point.x, point.y];
        
        if (CGRectContainsPoint(box.frame, point))
        {
            box.center = point;
            touchForBox1 = touch;
        }else if (CGRectContainsPoint(box2.frame, point))
        {
            box2.center = point;
            touchForBox2 = touch;
        }
        
        
    }
    

    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for(UITouch *touch in touches)
    {
        CGPoint point = [touch locationInView:self.view];
        
        
        
        coordLabel.text = [NSString stringWithFormat:@"(%.2f, %.2f)", point.x, point.y];
        
        if (touchForBox1 == touch)
        {
            box.center = point;
        }else if (touchForBox2 == touch)
        {
            box2.center = point;
        }
        
        
    }
    

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    coordLabel.text = @"Not Touching";
    
    for(UITouch *touch in touches)
    {
        CGPoint point = [touch locationInView:self.view];
        
        
        
        coordLabel.text = [NSString stringWithFormat:@"(%.2f, %.2f)", point.x, point.y];
        
        if (touchForBox1 == touch)
        {
            touchForBox1 = nil;
        }
        
        if (touchForBox2 == touch)
        {
            touchForBox2 = nil;
        }
        
        
    }
}



@end
