//
//  UITextField+CZInspectableTextField.m
//  CZInspectableViewDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Clay Zhu. All rights reserved.
//

#import "UITextField+CZInspectableTextField.h"

@implementation UITextField (CZInspectableTextField)

- (UIColor *)placeholderColor {
	return [self valueForKeyPath:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor {
	[self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end
