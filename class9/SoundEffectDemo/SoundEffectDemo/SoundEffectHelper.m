//
//  SoundEffectHelper.m
//  SoundEffectDemo
//
//  Created by Freshman on 6/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundEffectHelper.h"

#import <AudioToolbox/AudioToolbox.h>

#import <AVFoundation/AVFoundation.h>

@implementation SoundEffectHelper 

+ (void)playSFX 
{
    SystemSoundID soundID;
    
    // get the filepath from filename.
    NSString* soundPath = [[NSBundle mainBundle] pathForResource:@"sfx" ofType:@"wav"];
    
    // create CFURLRef from the path, which we will use for AudioServices
    CFURLRef soundFileRef = (CFURLRef)CFBridgingRetain([[NSURL alloc] initFileURLWithPath:soundPath]);
    
    AudioServicesCreateSystemSoundID(soundFileRef, &soundID);
    
    AudioServicesPlaySystemSound(soundID);
}

+ (void)playSFXByAudioPlayer
{
    NSString* soundPath = [[NSBundle mainBundle] pathForResource:@"sfx" ofType:@"wav"];
    
    NSURL *url = [NSURL fileURLWithPath:soundPath];
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    // prevent the AudioPlayer interruping the iPod music playing.
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
    
    [player play];
}

+ (void)vibrate
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

@end
