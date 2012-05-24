//
//  ViewController.m
//  SliderRGB
//
//  Created by Freshman on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    float r;
    float g;
    float b;
}

@synthesize labelR;
@synthesize labelG;
@synthesize labelB;
@synthesize rgbPreviewBox;
@synthesize hexLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLabelR:nil];
    [self setLabelG:nil];
    [self setLabelB:nil];
    [self setRgbPreviewBox:nil];
    [self setHexLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [labelR release];
    [labelG release];
    [labelB release];
    [rgbPreviewBox release];
    [hexLabel release];
    [super dealloc];
}

- (void)refreshPreviewBox
{
    rgbPreviewBox.backgroundColor = [UIColor colorWithRed:r/255.0f 
                                                    green:g/255.0f 
                                                     blue:b/255.0f 
                                                    alpha:1];
}

- (void)refreshHexLabel
{
    hexLabel.text = [NSString stringWithFormat:@"#%02X%02X%02X",(int)r, (int)g, (int)b];
    
    // change the label color if it is difficult to see.
    if (r+g+b < 255 * 3 / 2)
    {
        hexLabel.textColor = [UIColor whiteColor];
    }
    else 
    {
        hexLabel.textColor = [UIColor blackColor];
    }
}

- (IBAction)sliderRChanged:(id)sender {
    r = [(UISlider*)sender value];    
    labelR.text = [NSString stringWithFormat:@"%.0f", r];
    [self refreshPreviewBox];
    [self refreshHexLabel];
}

- (IBAction)sliderGChanged:(id)sender {
    g = [(UISlider*)sender value];
    labelG.text = [NSString stringWithFormat:@"%.0f", g];
    [self refreshPreviewBox];
    [self refreshHexLabel];
}

- (IBAction)sliderBChanged:(id)sender {
    b = [(UISlider*)sender value];
    labelB.text = [NSString stringWithFormat:@"%.0f", b];
    [self refreshPreviewBox];
    [self refreshHexLabel];
}



@end
