//
//  UIView+CZInspectableView.m
//  CZInspectableViewDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Clay Zhu. All rights reserved.
//

#import "UIView+CZInspectableView.h"
#import <objc/runtime.h>

@implementation UIView (CZInspectableView)

- (CGFloat)cornerRadius {
	return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
	self.layer.masksToBounds = YES;
	self.layer.cornerRadius = cornerRadius;
}

- (CGFloat)borderWidth {
	return self.layer.borderWidth;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
	self.layer.borderWidth = borderWidth;
}

- (UIColor *)borderColor {
	return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderColor:(UIColor *)borderColor {
	self.layer.borderColor = borderColor.CGColor;
}

//- (CGFloat)defineValue {
//	return [objc_getAssociatedObject(self, @selector(defineValue)) floatValue];
//}

//- (void)setDefineValue:(CGFloat)defineValue {
//	objc_setAssociatedObject(self, @selector(defineValue), @(defineValue), OBJC_ASSOCIATION_ASSIGN);
//}

@end
