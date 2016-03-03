# PlaygroundTesting

[![Build Status](https://travis-ci.org/dornad/PlaygroundTesting.svg?branch=master)](https://travis-ci.org/dornad/PlaygroundTesting)
[![Version](https://img.shields.io/cocoapods/v/PlaygroundTesting.svg?style=flat)](http://cocoapods.org/pods/PlaygroundTesting)
[![License](https://img.shields.io/cocoapods/l/PlaygroundTesting.svg?style=flat)](http://cocoapods.org/pods/PlaygroundTesting)
[![Platform](https://img.shields.io/cocoapods/p/PlaygroundTesting.svg?style=flat)](http://cocoapods.org/pods/PlaygroundTesting)

## Unit Tests in Xcode Playgrounds ?

Playgrounds are a great way to prototype and (quickly) iterate on your codebase.  However, Unit Tests are often left behind, or an afterthought.

It would be great to iterate on your unit tests as well!  Unfortunately, Playgrounds do not support importing `XCTest` (yet).  
> **Note:** This is true as of Xcode 7.2.1

Enter `PlaygroundTesting`!

![Imgur](http://i.imgur.com/wnWi8cP.png)

## Installation

PlaygroundTesting is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "PlaygroundTesting"
```

To use `PlaygroundTesting` in your Playgrounds, you need to follow Apple's Guidelines for [Importing Custom Frameworks into Playgrounds](https://developer.apple.com/library/ios/recipes/Playground_Help/Chapters/ImportFramework.html): 

* The framework is in the same workspace as the playground.
* The framework has already been built.
* The workspace contains at least one active scheme that builds a target.

## Usage

`PlaygroundTesting` is very flexible.  You can

* Use `XCTAssert & Friends` directly on the Playground.
* Create a Test Case Type that implements [TestCaseProtocol](https://github.com/dornad/PlaygroundTesting/blob/master/Pod/Classes/TestPlayground/Protocols/TestCaseProtocol.swift) and run its tests.
* Run individual tests

The example project includes a sample Playground.  To run the Playground, clone the repo, and run pod install from the Example directory first.

## Author

Daniel Rodriguez, daniel@danielrodriguez.name

## License

PlaygroundTesting is available under the MIT license. See the LICENSE file for more info.
