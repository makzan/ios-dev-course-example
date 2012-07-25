//
//  ViewController.m
//  PickerDemo
//
//  Created by Freshman on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize leftNumberLabel;
@synthesize rightNumberLabel;
@synthesize leftUnitLabel;
@synthesize rightUnitLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLeftNumberLabel:nil];
    [self setRightNumberLabel:nil];
    [self setLeftUnitLabel:nil];
    [self setRightUnitLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 3; // both left and right picker component has the same amount of rows
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // both left and right components share the same rows and text
    // otherwise we need to distingush them.
    
    switch (row) {
        case 0:
            return @"kilograms";
            break;
        case 1:
            return @"pounds";
            break;
        case 2:
            return @"ounces";
            break;
        default:
            break;
    }
    
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        if (row == 0)
        {
            leftUnitLabel.text = @"kilograms";
        }
        else if (row == 1)
        {
            leftUnitLabel.text = @"pounds";            
        }
        else if (row == 2)
        {
            leftUnitLabel.text = @"ounces";
        }
    }
    else if (component == 1)
    {
        if (row == 0)
        {
            rightUnitLabel.text = @"kilograms";
        }
        else if (row == 1)
        {
            rightUnitLabel.text = @"pounds";            
        }
        else if (row == 2)
        {
            rightUnitLabel.text = @"ounces";
        }
    }
    
    [self refreshNumbers];
}

- (void)refreshNumbers
{
    if ([leftUnitLabel.text isEqualToString:@"kilograms"] && [rightUnitLabel.text isEqualToString:@"kilograms"])
    {
        rightNumberLabel.text = @"1";
    }
    else if ([leftUnitLabel.text isEqualToString:@"kilograms"] && [rightUnitLabel.text isEqualToString:@"pounds"])
    {
        rightNumberLabel.text = @"2.20";
    }
    else if ([leftUnitLabel.text isEqualToString:@"kilograms"] && [rightUnitLabel.text isEqualToString:@"ounces"])
    {
        rightNumberLabel.text = @"35.27";
    }
    else if ([leftUnitLabel.text isEqualToString:@"pounds"] && [rightUnitLabel.text isEqualToString:@"kilograms"])
    {
        rightNumberLabel.text = @"0.45";
    }
    else if ([leftUnitLabel.text isEqualToString:@"pounds"] && [rightUnitLabel.text isEqualToString:@"pounds"])
    {
        rightNumberLabel.text = @"1";
    }
    else if ([leftUnitLabel.text isEqualToString:@"pounds"] && [rightUnitLabel.text isEqualToString:@"ounces"])
    {
        rightNumberLabel.text = @"16";
    }
    else if ([leftUnitLabel.text isEqualToString:@"ounces"] && [rightUnitLabel.text isEqualToString:@"kilograms"])
    {
        rightNumberLabel.text = @"0.028";
    }
    else if ([leftUnitLabel.text isEqualToString:@"ounces"] && [rightUnitLabel.text isEqualToString:@"pounds"])
    {
        rightNumberLabel.text = @"0.0625";
    }
    else if ([leftUnitLabel.text isEqualToString:@"ounces"] && [rightUnitLabel.text isEqualToString:@"ounces"])
    {
        rightNumberLabel.text = @"1";
    }
}

- (void)dealloc {
    [leftNumberLabel release];
    [rightNumberLabel release];
    [leftUnitLabel release];
    [rightUnitLabel release];
    [super dealloc];
}
@end
