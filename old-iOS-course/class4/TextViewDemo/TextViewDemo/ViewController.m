//
//  ViewController.m
//  TextViewDemo
//
//  Created by Freshman on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void)textViewDidBeginEditing:(UITextView *)textView
{
    CGRect frame = self.view.frame;
    frame.origin.y = -100;
    [UIView animateWithDuration:.3 animations: ^{
        self.view.frame = frame;
    }];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    [UIView animateWithDuration:.3 animations: ^{
        self.view.frame = frame;
    }];
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

@end
