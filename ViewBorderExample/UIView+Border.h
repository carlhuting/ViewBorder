//
//  UIView+Border.h
//  TestBorder
//
//  Created by lkeg on 15/10/28.
//  Copyright © 2015年 lkeg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger,UIViewBorder) {
    UIViewBorderTop     = 1 << 0,
    UIViewBorderRight   = 1 << 1,
    UIViewBorderBottom  = 1 << 2,
    UIViewBorderLeft    = 1 << 3,
    UIViewBorderAll     = 0x0F
};

@interface UIView (Border)

- (void) setBorder: (UIViewBorder)option  width:(CGFloat)width color: (UIColor *)color;
//- (void) setDashBorder: (UIViewBorder)option  width:(CGFloat)width color: (UIColor *)color;
- (void) roundCornerWithDashBorder: (CGFloat)radius width: (CGFloat)widht color: (UIColor *)color;



@end
