//
//  ViewController.m
//  SoundEffectDemo
//
//  Created by Freshman on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SoundEffectHelper.h"

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

- (IBAction)tappedPlaySFX:(id)sender {
    [SoundEffectHelper playSFX];
}

- (IBAction)tappedPlaySFXWithAudioPlayer:(id)sender {
    [SoundEffectHelper playSFXByAudioPlayer];
}

- (IBAction)tappedVibration:(id)sender {
    [SoundEffectHelper vibrate];
}



@end
