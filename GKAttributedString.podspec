#
#  Be sure to run `pod spec lint GKAttributedString.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "GKAttributedString"
  s.version      = "0.1.0"
  s.summary      = "Elegent AttributedString in Swift."

  s.homepage     = "https://github.com/xiaofeng2013/"

  s.license      = "MIT"


  s.author             = { "丰文佳" => "xiaofeng20150227@gmail.com" }
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/xiaofeng2013/GKAttributedString.git", :tag => s.version }

  s.source_files  = "GKAttributedString", "GKAttributedString/**/*.{h,m,swift}"

  s.requires_arc = true

end
