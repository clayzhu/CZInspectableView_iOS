//
//  UIView+CZInspectableView.h
//  CZInspectableViewDemo
//
//  Created by Apple on 2017/3/23.
//  Copyright © 2017年 Clay Zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

/** 
 使用 IBInspectable 可以在 IB 的 Attributes Inspector 中创建如 cornerRadius 等原本并不支持操作的属性，
 使用 IB_DESIGNABLE 可以在 IB 中直接看到修改上述属性后的渲染效果。
 使用 UIView 的 Category，并且继承一个 UIView、UILabel 等的子类，可以自动使用这些效果。
 需要更多属性时，可以扩展。
 */
@interface UIView (CZInspectableView)

/** 圆角 */
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
/** 边框宽度 */
@property (assign, nonatomic) IBInspectable CGFloat borderWidth;
/** 边框颜色 */
@property (strong, nonatomic) IBInspectable UIColor *borderColor;

/** 自定义值 */
@property (assign, nonatomic) IBInspectable CGFloat defineValue;

@end
