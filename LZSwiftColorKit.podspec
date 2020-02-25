
Pod::Spec.new do |s|
  s.name             = 'LZSwiftColorKit'
  s.version          = '0.0.1'
  s.summary          = 'ColorKit Manger!'

  s.description      = <<-DESC
                Make colors easier to use
                       DESC

  s.homepage         = 'https://github.com/chenjianlei/LZSwiftColorKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenjianlei' => 'woshixiaolei@qq.com' }
  s.source           = { :git => 'https://github.com/chenjianlei/LZSwiftColorKit.git', :tag => s.version.to_s }
  
  s.swift_version = "4.2"
  s.swift_versions = ['4.0', '4.2', '5.0']

  s.ios.deployment_target = '8.0'

  s.source_files = 'LZSwiftColorKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LZSwiftColorKit' => ['LZSwiftColorKit/Assets/*.png']
  # }

#   s.public_header_files = 'Pod/Classes/**/*.swift'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
