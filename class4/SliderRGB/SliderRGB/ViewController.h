//
//  ViewController.h
//  SliderRGB
//
//  Created by Freshman on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *labelR;
@property (retain, nonatomic) IBOutlet UILabel *labelG;
@property (retain, nonatomic) IBOutlet UILabel *labelB;
@property (retain, nonatomic) IBOutlet UIView *rgbPreviewBox;
@property (retain, nonatomic) IBOutlet UILabel *hexLabel;
- (IBAction)sliderRChanged:(id)sender;
- (IBAction)sliderGChanged:(id)sender;
- (IBAction)sliderBChanged:(id)sender;

@end
