Pod::Spec.new do |s|
    s.name         = 'YHNavigationBar'
    s.version      = '1.0.2'
    s.summary      = 'An UINavigationController obj enable fullscreen pop gesture.'
    s.description  = <<-DESC
        An UINavigationController obj enable fullscreen pop gesture, and easy control hidden or not.
                   DESC
    s.homepage     = 'https://github.com/yelinux/YHNavigationBar'
    s.license      = { :type => "MIT", :file => 'LICENSE' }
    s.authors      = {'chenyehong' => 'ye_linux@126.com'}
    s.platform     = :ios, '9.0'
    s.source       = {:git => 'https://github.com/yelinux/YHNavigationBar.git', :tag => s.version}
    s.source_files = 'YHNavigationBar/*.{h,m}'
    s.requires_arc = true
    s.ios.frameworks = 'UIKit'
    s.ios.deployment_target = '9.0'
  end
