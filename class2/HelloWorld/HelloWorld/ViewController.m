//
//  ViewController.m
//  HelloWorld
//
//  Created by Freshman on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nameTextField;
@synthesize firstLabel;
@synthesize secondLabel;
@synthesize thirdLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *caption = @"Addition";
    
    int a = 100;
    int b = 12;
    int c = a + b;
    
    firstLabel.text = [NSString stringWithFormat:@"%@: %d + %d = %d", caption, a, b, c];
    firstLabel.textColor = [UIColor redColor];
    firstLabel.font = [UIFont systemFontOfSize:24.0f];
    
}

- (void)viewDidUnload
{
    [self setFirstLabel:nil];
    [self setSecondLabel:nil];
    [self setThirdLabel:nil];
    [self setNameTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [firstLabel release];
    [secondLabel release];
    [thirdLabel release];
    [nameTextField release];
    [super dealloc];
}

- (void)showGreetingMessage {
    // hide the keyboard.
    [nameTextField resignFirstResponder];
    
    // calculate how much is the MOP
    float usd = [nameTextField.text floatValue];
    float mop = usd * 7.8;
    firstLabel.text = [NSString stringWithFormat:@"MOP: $%0.2f", mop];
}


// TextField delegates
- (BOOL)textFieldShouldReturn:(UITextField*)textField {
    
    [self showGreetingMessage];
    
    return YES;
}



- (IBAction)sayGreeting:(id)sender {
    [self showGreetingMessage];
}


@end
