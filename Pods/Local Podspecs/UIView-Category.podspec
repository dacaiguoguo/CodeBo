
Pod::Spec.new do |s|
  s.name         = "UIView-Category"
  s.version      = "1.0.1"
  s.summary      = " UIView Category"

  s.description  = <<-DESC
                   A longer description of UIView-Category in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/dacaiguoguo/UIView-Category"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "dacaiguoguo" => "dacaiguoguo@163.com" }
  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'
  s.source       = { :git => "https://github.com/dacaiguoguo/UIView-Category.git", :tag => "1.0.1" }
  s.source_files  = 'CustomView/*.{h,m}'
end
