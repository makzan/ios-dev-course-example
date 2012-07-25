//
//  UIView+Position.m
//  CategoryDemo
//
//  Created by Freshman on 5/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIView+Position.h"

@implementation UIView (Position)

- (void)setX:(float)x andY:(float)y
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    frame.origin.y = y;
    self.frame = frame;
}

@end
