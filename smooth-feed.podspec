#
# Be sure to run `pod lib lint smooth-feed.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'smooth-feed'
  s.version          = '0.1.0'
  s.summary          = 'Custom UICollectionViewLayout for smooth feed concept.'
  s.swift_version    = '5.0'
  s.homepage         = 'https://github.com/Cuberto/smooth-feed'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'denisshvetsov' => 'denis.shvetsov.main@gmail.com' }
  s.source           = { :git => 'https://github.com/Cuberto/smooth-feed.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cuberto'

  s.ios.deployment_target = '9.3'

  s.source_files = 'smooth-feed/Classes/**/*'
end
