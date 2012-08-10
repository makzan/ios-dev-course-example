//
//  ViewController.h
//  SliderRGB
//
//  Created by Freshman on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelR;
@property (strong, nonatomic) IBOutlet UILabel *labelG;
@property (strong, nonatomic) IBOutlet UILabel *labelB;
@property (strong, nonatomic) IBOutlet UIView *rgbPreviewBox;
@property (strong, nonatomic) IBOutlet UILabel *hexLabel;
- (IBAction)sliderRChanged:(id)sender;
- (IBAction)sliderGChanged:(id)sender;
- (IBAction)sliderBChanged:(id)sender;

@end
