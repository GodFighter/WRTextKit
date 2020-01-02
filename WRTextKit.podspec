Pod::Spec.new do |s|
    s.name         = 'WRTextKit'
    s.version      = "1.1.4"
    s.summary      = '竖向蒙文标签控件'
    s.description  = '竖向蒙文标签控件，支持上下左右对齐'
    s.homepage     = 'https://github.com/GodFighter/WRTextKit'
    s.license      = 'MIT'
    s.author       = { 'Leo Xiang' => 'xianghui_ios@163.com' }
    s.source       = { :git => 'https://github.com/GodFighter/WRTextKit.git', :tag => s.version, :submodules => true }
    s.ios.deployment_target = '9.0'
    s.frameworks   = 'UIKit','Foundation'
    s.social_media_url = 'http://weibo.com/huigedang/home?wvr=5&lf=reg'
    s.requires_arc = true
    s.ios.deployment_target = '9.0'

    s.source_files = 'WRTextKit/*.{h,m}'
    s.subspec 'CoreText' do |ss|
        ss.source_files = 'WRTextKit/CoreText/*.{h,m}'
        ss.dependency 'WRTextKit/WRVerticalLabel.h'
    end


end
