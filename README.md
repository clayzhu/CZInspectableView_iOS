# CZInspectableView_iOS
使用 IB_DESIGNABLE 和 IBInspectable 关键字，构建了一个 UIView 的 Category，使得可以在 IB 中直接操作并观察一些 Xcode 原本并不支持操作和渲染的属性。

## 1. 介绍

使用 `Interface Builder` 绘制 UI 时，碰到设置控件的圆角、边框之类的就比较头疼，IB 上不能像背景色那样有直接的属性可以设置。

有一个解决办法是在 IB 的 `Identity Inspector` 选项卡的 `User Defined Runtime Attributes` 中通过属性的 `Key Path` 和 `Value` 设置。但这个无法在 IB 中实时显示。

iOS 为我们提供了 `IB_DESIGNABLE` 和 `IBInspectable` 关键字。前者能让 `User Defined Runtime Attributes` 中的设置实时显示在 IB 上；后者允许我们自定义属性，直接在 `Attributes Inspector` 中设置（本质上是设置在 `User Defined Runtime Attributes` 中），比如圆角，原本并不能直接在 `Attributes Inspector` 选项卡中设置。

CZInspectableView_iOS 提供了3种控件部分属性的设置：

* UIView
  * 圆角
  * 边框宽度
  * 边框颜色
  * 阴影颜色
  * 阴影透明度
  * 阴影偏移
  * 阴影圆角
* UITextField
  * placeholder 颜色
  * UITextField 的边框左侧和文字左侧的距离
  * UITextField 的边框右侧和文字右侧的距离
* UIButton
  * 按钮 UIControlStateNormal 时的背景颜色
  * 按钮 UIControlStateHighlighted 时的背景颜色
  * 按钮 UIControlStateDisabled 时的背景颜色
  * 按钮 UIControlStateSelected 时的背景颜色

