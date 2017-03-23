//
//  UITextField+CZInspectableTextField.h
//  CZInspectableViewDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Clay Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CZInspectableTextField)

/** placeholder 颜色 */
@property (strong, nonatomic) IBInspectable UIColor *placeholderColor;

@end
