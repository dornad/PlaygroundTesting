// This source file is part of the PROJECT_NAME open source project
//
// Copyright (c) 2016 Daniel Rodriguez
// Licensed under LICENSE
//
// See LICENSE_FILE_URL for license information
//
// ATTRIBUTION_IDEA_SWIFT.ORG_TEXT
//
//
//  TestCaseProtocol.swift
//  Base protocol (and extension with default methods) for test cases
//
import Foundation

/**
Base protocol (and extension with default methods) for test cases.  Equivalent to `XCTest`.

## Using TestCaseProtocol

The original XCTest framework from Apple is able to find all of your tests by simply asking the Objective-C runtime for the subclasses 
f XCTestCase. It then finds the methods that start with the string test. 

This functionality is not currently present when running PlaygroundTesting (or the Swift runtime for that matter). Therefore, you must 
currently provide an additional property called allTests in your TestCaseProtocol adopters. This property lists all of the tests in 
the test class. The rest of your test case subclass still contains your test methods.

- seealso: https://github.com/apple/swift-corelibs-xctest
- seealso: https://github.com/apple/swift-corelibs-xctest/blob/master/Sources/XCTest/XCTestCase.swift

```
// File.playground
let foo = "Playground"

class MyTestCase : TestCaseProtocol {
    
    var allTests : [] {
        return [
            ("test_myTest", test_myTest),
            ("test_anotherTest", test_anotherTest ),
            ("test_yetAnotherTest", test_yetAnotherTest),            
            // Other tests go here
        ]
    }

    func test_myTest() {
        // Write your test here. Most of the XCTAssert macros you are familiar with are available.
        XCTAssertTrue(theNumberOne == 42, "The number is wrong")
    }

    // Other tests go here
}

let testCase = MyTestCase()
testCase.invokeTests()
```
*/
public protocol TestCaseProtocol: TestCaseProvider {

	func setUp()
	func tearDown()
}

extension TestCaseProtocol {

	/// - todo: (From Swift.org) When using the Objective-C runtime, XCTest is able to throw an exception from an assert 
	/// and then catch it at the frame above the test method. This enables the framework to effectively stop all execution 
	/// in the current test. There is no such facility in Swift. Until we figure out how to get a compatible behavior, we 
	/// have decided to hard-code the value of 'true' for continue after failure.
	public var continueAfterFailure: Bool {
        get {
            return true
        }
        set {
         	// NO-OP   
        }
    }

    /**

	- todo: Add Test Case duration tracking as in https://github.com/apple/swift-corelibs-xctest
	- todo: Investigate if need to implement a similar type to XCTFailure.
    */
    public func invokeTests() {
        
        let tests = self.allTests
        
        for (name, test) in tests {

        	let method = "\(self.dynamicType).\(name)"

        	var failures = [String]()
            let failureHandler: String -> Void = { failure in
        		if !self.continueAfterFailure {
        			fatalError("Terminating execution due to test failure")
        		} else {
        			failures.append(failure)
        		}
        	}

        	print("Test Case '\(method)' started.")

        	setUp()

        	do {
        		try test()
        	} catch {
        		failureHandler(method)        		
        	}

        	tearDown()

        	let result = failures.count > 0 ? "failed" : "passed"

        	print("Test Case '\(method)' \(result).")
        }
    }
    
    public func setUp() {
        
    }
    
    public func tearDown() {
        
    }
}
