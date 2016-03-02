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
  s.summary          = "A Cocoa Touch framework for running Unit Tests inside a Playground."
  s.description      = <<-DESC
                       Use Xcode Playgrounds to iterate on your code and your unit tests.

                       The unit tests available to playgrounds are a subset of XCTest, more coming soon!                       
                      DESC
  s.homepage         = "https://github.com/dornad/PlaygroundTesting"
  s.license          = 'MIT'
  s.author           = { "Daniel Rodriguez" => "daniel@danielrodriguez.name" }
  s.source           = { :git => "https://github.com/dornad/PlaygroundTesting.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PlaygroundTesting' => ['Pod/Assets/*.png']
  }
end
