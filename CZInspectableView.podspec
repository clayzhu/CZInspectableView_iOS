
Pod::Spec.new do |s|

  s.name         = "CZInspectableView"
  s.version      = "1.0.3"
  s.summary      = "使用 IB_DESIGNABLE 和 IBInspectable 关键字，构建了一个 UIView 的 Category，使得可以在 IB 中直接操作并观察一些 Xcode 原本并不支持操作和渲染的属性。"
  s.description  = <<-DESC
  使用 Interface Builder 绘制 UI 时，碰到设置控件的圆角、边框之类的就比较头疼，IB 上不能像背景色那样有直接的属性可以设置。
  有一个解决办法是在 IB 的 Identity Inspector 选项卡的 User Defined Runtime Attributes 中通过属性的 Key Path 和 Value 设置。但这个无法在 IB 中实时显示。
  iOS 为我们提供了 IB_DESIGNABLE 和 IBInspectable 关键字。前者能让 User Defined Runtime Attributes 中的设置实时显示在 IB 上；后者允许我们自定义属性，直接在 Attributes Inspector 中设置（本质上是设置在 User Defined Runtime Attributes 中），比如圆角，原本并不能直接在 Attributes Inspector 选项卡中设置。
                   DESC

  s.homepage     = "https://github.com/clayzhu/CZInspectableView_iOS"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Clay Zhu" => "clayzhu@163.com" }

  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/clayzhu/CZInspectableView_iOS.git", :tag => "#{s.version}" }
  s.source_files  = "CZInspectableView/**/*.{h,m}"

end
