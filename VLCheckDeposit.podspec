#
# Be sure to run `pod lib lint VLCheckDeposit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VLCheckDeposit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of VLCheckDeposit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ashish.mishra@eastwestbank.com/VLCheckDeposit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ashish.mishra@eastwestbank.com' => 'ashish.mishra@eastwestbank.com' }
  s.source           = { :git => 'https://github.com/ashish.mishra@eastwestbank.com/VLCheckDeposit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'
  
  s.source_files = 'VLCheckDeposit/Classes/**/*'
  s.resources = 'VLCheckDeposit/Assets/**/*.{xcassets,json,imageset}'
  
  # s.resource_bundles = {
  #   'VLCheckDeposit' => ['VLCheckDeposit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'VLCommonClasses', '1.12.0'
  s.dependency 'VLAPI', '1.12.0'
  s.dependency 'VLComponents', '1.12.0'
  s.dependency 'VLBaseClasses', '1.12.0'
end
