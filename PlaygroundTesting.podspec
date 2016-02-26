#
# Be sure to run `pod lib lint PlaygroundTesting.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PlaygroundTesting"
  s.version          = "0.1.0"
  s.summary          = "A short description of PlaygroundTesting."
  s.description      = <<-DESC
                       A framework for running Unit Tests inside a Playground.
                      DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/PlaygroundTesting"
  s.license          = 'MIT'
  s.author           = { "Daniel Rodriguez" => "daniel@justsingit.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/PlaygroundTesting.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PlaygroundTesting' => ['Pod/Assets/*.png']
  }
end
