//
//  ViewController.h
//  HelloWorld
//
//  Created by Freshman on 5/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *firstLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;
@property (strong, nonatomic) IBOutlet UILabel *thirdLabel;
- (IBAction)sayGreeting:(id)sender;


// the private method to show greeting message from textfield to label.
- (void)showGreetingMessage;

@end
