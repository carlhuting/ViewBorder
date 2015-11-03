//
//  UIView+Border.m
//  TestBorder
//
//  Created by lkeg on 15/10/28.
//  Copyright © 2015年 lkeg. All rights reserved.
//

#import "UIView+Border.h"
#import <UIKit/UIKit.h>

@implementation UIView (Border)

- (void)setBorder:(UIViewBorder)option width:(CGFloat)width color:(UIColor *)color {
    if (option & UIViewBorderTop) {
        [self addTopBorderWithColor:color andWidth:width];
    }
    if (option & UIViewBorderLeft) {
        [self addLeftBorderWithColor:color andWidth:width];
    }
    if (option & UIViewBorderBottom) {
        [self addBottomBorderWithColor:color andWidth:width];
    }
    if (option & UIViewBorderRight) {
        [self addRightBorderWithColor:color andWidth:width];
    }
}

- (void)addTopBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    [border setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin];
    border.frame = CGRectMake(0, 0, self.frame.size.width, borderWidth);
    [self addSubview:border];
}

- (void)addBottomBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    [border setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, borderWidth);
    [self addSubview:border];
}

- (void)addLeftBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    border.frame = CGRectMake(0, 0, borderWidth, self.frame.size.height);
    [border setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleRightMargin];
    [self addSubview:border];
}

- (void)addRightBorderWithColor:(UIColor *)color andWidth:(CGFloat) borderWidth {
    UIView *border = [UIView new];
    border.backgroundColor = color;
    [border setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin];
    border.frame = CGRectMake(self.frame.size.width - borderWidth, 0, borderWidth, self.frame.size.height);
    [self addSubview:border];
}

-  (void)drawRect:(CGRect)rect {
    NSLog(@"hah a");
    NSLog(@"%@",NSStringFromCGRect(rect));
    [self setDashBorder:UIViewBorderAll width:1 color:[UIColor purpleColor] rect:rect];
}

- (void)setDashBorder:(UIViewBorder) option width:(CGFloat)width color:(UIColor *)color rect:(CGRect)rect         {
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGRect frame = rect;
    switch (option) {
        case UIViewBorderTop:
            frame.size.height = width;
            [path moveToPoint: CGPointMake(0, 0)];
            [path addLineToPoint: CGPointMake(frame.size.width, 0)];
            break;
        case UIViewBorderRight:
            frame.origin.x = frame.size.width - width;
            frame.size.width = width;
            [path moveToPoint: CGPointMake(frame.size.width, 0)];
            [path addLineToPoint: CGPointMake(frame.size.width, frame.size.height)];
            break;
        case UIViewBorderBottom:
            frame.origin.y = frame.size.height - width;
            frame.size.height = width;
            [path moveToPoint: CGPointMake(0, frame.size.height)];
            [path addLineToPoint: CGPointMake(frame.size.width, frame.size.height)];
            break;
        case UIViewBorderLeft:
            frame.size.width = width;
            [path moveToPoint: CGPointMake(0, 0)];
            [path addLineToPoint: CGPointMake(0, frame.size.height)];
            break;
        case UIViewBorderAll:
            [self setDashBorder: UIViewBorderBottom width:width color: color rect:rect];
            [self setDashBorder: UIViewBorderLeft width:width color: color rect:rect];
            [self setDashBorder: UIViewBorderRight width:width color: color rect:rect];
            [self setDashBorder: UIViewBorderTop width:width color: color rect:rect];
            break;
    }
    shapelayer.frame = frame;
    
    shapelayer.strokeStart = 0.0;
    shapelayer.strokeColor = color.CGColor;
    shapelayer.fillColor = [[UIColor clearColor] CGColor];
    shapelayer.lineWidth = width;
    shapelayer.lineJoin = kCALineJoinMiter;
    shapelayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:2], nil];
    shapelayer.lineDashPhase = 2.0f;
    shapelayer.path = path.CGPath;
    [self.layer addSublayer: shapelayer];
}

- (void)roundCornerWithDashBorder:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect: self.bounds cornerRadius: radius];
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    shapelayer.frame = self.bounds;
    shapelayer.strokeStart = 0.0;
    shapelayer.strokeColor = color.CGColor;
    shapelayer.fillColor = [[UIColor clearColor] CGColor];
    shapelayer.lineWidth = width;
    shapelayer.lineJoin = kCALineJoinMiter;
    shapelayer.lineDashPattern = [NSArray arrayWithObjects:[NSNumber numberWithInt:4],[NSNumber numberWithInt:2], nil];
    shapelayer.lineDashPhase = 2.0f;
    shapelayer.path = path.CGPath;
    [self.layer insertSublayer: shapelayer atIndex: 0];
    //[self.layer addSublayer: shapelayer];
    
}

@end
