# CZInspectableView_iOS
使用 IB_DESIGNABLE 和 IBInspectable 关键字，构建了一个 UIView 的 Category，使得可以在 IB 中直接操作并观察一些 Xcode 原本并不支持操作和渲染的属性。

* [1. 介绍](#1-介绍)
* [2. 安装](#2-安装)
* [3. 说明](#3-说明)
  * [3.1 添加控件系统属性](#31-添加控件系统属性)
  * [3.2 添加控件自定义属性](#32-添加控件自定义属性)
* [4. 示例](#4-示例)

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

## 2. 安装

下载 [CZInspectableView_iOS](https://github.com/clayzhu/CZInspectableView_iOS/archive/master.zip)，将 `/CZInspectableViewDemo/CZInspectableView` 文件夹拖入项目中，记得在 `Destination: Copy items if needed` 前面打勾。

## 3. 说明

`/CZInspectableViewDemo/CZInspectableView` 文件夹下包含两个子文件夹：`Category`、`View`。`Category` 文件夹下的一系列 Category 文件是主要实现文件；而 `View` 文件夹下的一系列子类文件则是辅助实现文件。

这是由于，只要在分类中实现带 `IBInspectable` 关键字的属性，在 IB 的 `Attributes Inspector` 中就能对相应控件操作。但要能在 IB 中实时显示操作的结果，要在分类中声明 `IB_DESIGNABLE` 关键字，并在 IB 中继承相应控件的子类。所以，如果要在 IB 中看下实时的效果，可以简单地继承下 `View` 文件夹下相应的类。

### 3.1 添加控件系统属性

**举个🌰：**

`UIView` 的 `layer.masksToBounds` 不能在 IB 中直接操作。要实现在 IB 中操作，并实时显示的功能，需要在 `UIView+CZInspectableView.h` 中，声明 `masksToBounds` 属性（属性名称随意，易懂即可）：

```objc
/** 设置超过子图层的部分裁减掉 */
@property (assign, nonatomic) IBInspectable BOOL masksToBounds;
```

然后在对应 `UIView+CZInspectableView.m` 文件中实现这个属性的 getter 和 setter 方法：

```objc
- (BOOL)masksToBounds {
    return self.layer.masksToBounds;
}

- (void)setMasksToBounds:(BOOL)masksToBounds {
    self.layer.masksToBounds = masksToBounds;
}
```

### 3.2 添加控件自定义属性

**更有价值的是**，通过 runtime，我们还能自定义所需要的属性，从而实现在 IB 中操作它们。

**再举个🌰：**

在 `.h` 中声明一个自定义的属性：

```objc
/** 自定义属性 */
@property (assign, nonatomic) IBInspectable CGFloat defineValue;
```

在 `.m` 中使用 runtime 实现属性值的存取（需要导入 runtime 库）：

```objc
- (CGFloat)defineValue {
	return [objc_getAssociatedObject(self, @selector(defineValue)) floatValue];
}

- (void)setDefineValue:(CGFloat)defineValue {
	objc_setAssociatedObject(self, @selector(defineValue), @(defineValue), OBJC_ASSOCIATION_ASSIGN);
}
```

同理，`UITextField` 和 `UIButton` 也使用 Category 实现部分在 IB 中不方便设置的属性。

## 4. 示例

把 `CZInspectableView` 中的 Category 导入后，不需要做任何操作，即可在 IB 的 `Attributes Inspector` 中直接设置相应的属性。

**以 `UITextField` 为例**

![IB 中直接设置属性](http://ompmj0bxx.bkt.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202017-06-10%2022.41.22.png)

从图中可以看出，`Attributes Inspector` 中除了可以设置 `UITextField+CZInspectableTextField` 中添加的设置 placeholder 的颜色等属性外，还能设置 `UITextField` 父类 `UIView` 的 Category 中添加的属性。

由于 Category 中添加了 `IB_DESIGNABLE` 关键字，如果在 IB 的 `Identity Inspector` 中的 `Class` 中继承任意一个 `UITextField` 子类，即可在 IB 中看到设置的实时渲染效果。比如图中设置的 placeholder 颜色。

**PS：**每次打开 IB，都会自动进行实时渲染的编译，这会影响 Xcode 的速度，有时候还会出现渲染失败的错误提醒。如果不需要自动渲染，只需要在 Xcode 的菜单 `Editor` 中，关闭 `Automatically Refresh Views`。当需要手动刷新渲染时，选择 `Refresh All Views`。

