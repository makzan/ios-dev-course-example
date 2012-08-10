//
//  ViewController.h
//  PickerDemo
//
//  Created by Freshman on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *leftNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightNumberLabel;
@property (strong, nonatomic) IBOutlet UILabel *leftUnitLabel;
@property (strong, nonatomic) IBOutlet UILabel *rightUnitLabel;

@end
