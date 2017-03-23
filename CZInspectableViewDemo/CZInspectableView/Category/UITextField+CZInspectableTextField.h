//
//  UITextField+CZInspectableTextField.h
//  CZInspectableViewDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Clay Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UITextField 的 Category CZInspectableTextField，添加 UITextField 专有的属性修改，而 UIView 共有的属性已经通过 CZInspectableView Category 自动实现。
 */
@interface UITextField (CZInspectableTextField)

/** placeholder 颜色 */
@property (strong, nonatomic) IBInspectable UIColor *placeholderColor;

@end
