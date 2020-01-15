#
#  Be sure to run `pod spec lint DPFactory.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

 

  s.name         = "DPFactory"
  s.version      = "0.0.5"
  s.summary      = "工厂类"
  s.homepage     = "https://github.com/HolyLe/DPFactory.git"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

   s.author       = { "麻小亮" => "zshnr1993@qq.com" }
   s.platform     = :ios, "8.0"
   s.ios.deployment_target = '8.0'
   s.source       = { :git => "https://github.com/HolyLe/DPFactory.git", :tag =>          s.version.to_s } 
  
  s.public_header_files = 'Factory/DPFactory.h'
  s.source_files  = "Factory/DPFactory.h"
  s.subspec 'ViewController' do |ss|
     ss.source_files = 'Factory/ViewController/*.{h,m}'
     ss.dependency "DPCategory"
  end

  s.subspec 'Proxy' do |ss|
     ss.source_files = 'Factory/Proxy/*.{h,m}'

  end
  
  s.subspec 'TextLabel' do |ss|
     ss.source_files = 'Factory/TextLabel/*.{h,m}'
     ss.framework  = "CoreText","UIKit"
  end
  s.subspec 'Timer' do |ss|
     ss.source_files = 'Factory/Timer/*.{h,m}'
 
  end
  s.subspec 'Oasis' do |ss|
     ss.vendored_frameworks = 'Factory/Oasis/OasisSDK.framework'
  end
  

end
