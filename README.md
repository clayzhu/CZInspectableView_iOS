# CZInspectableView_iOS
使用 IB_DESIGNABLE 和 IBInspectable 关键字，构建了一个 UIView 的 Category，使得可以在 IB 中直接操作并观察一些 Xcode 原本并不支持操作和渲染的属性。

## 1. 介绍

使用 `Interface Builder` 绘制 UI 时，碰到圆角、边框之类的设置就比较头疼，IB 上不能像背景色那样有直接的属性可以设置。

有一个解决办法是在 IB 的 `Identity Inspector` 选项卡的 `User Defined Runtime Attributes` 中通过属性的 `Key Path` 和 `Value` 设置。但这个无法在 IB 中实时显示。

