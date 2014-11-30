//
//  CoreGraphicBackground.m
//  BurgerMenu
//
//  Created by Vincent Lee on 11/29/14.
//  Copyright (c) 2014 VincentLee. All rights reserved.
//

#import "CoreGraphicBackground.h"

@implementation CoreGraphicBackground

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * redColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:1.0];

    CGContextSetFillColorWithColor(context, redColor.CGColor);
    CGContextFillRect(context, self.bounds);
}


@end
