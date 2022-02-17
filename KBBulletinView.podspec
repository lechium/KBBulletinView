#
# Be sure to run `pod lib lint KBBulletinView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KBBulletinView'
  s.version          = '1.3'
  s.summary          = 'Bulletin / Toast style view for tvOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This project is an effort to create local application notifications/alerts similar to those used by Apple in the top right when various system events occur (ie devices attach/detach, internet connectivity changes, etc).
                       DESC

  s.homepage         = 'https://github.com/lechium/KBBulletinView'
  s.screenshots     = 'https://github.com/lechium/KBBulletinView/blob/master/BulletinSample.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lechium' => 'kevin.w.bradley@me.com' }
  s.source           = { :git => 'https://github.com/lechium/KBBulletinView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.tvos.deployment_target = '9.0'

  s.source_files = 'KBBulletinView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KBBulletinView' => ['KBBulletinView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
