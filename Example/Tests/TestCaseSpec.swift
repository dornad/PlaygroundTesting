//
//  TestCaseSpec.swift
//  PlaygroundTesting
//
//  Created by Daniel Rodriguez on 2/25/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import PlaygroundTesting

class TestCaseSpec: QuickSpec {
    
    class MyTestCase: TestCaseProtocol {
        
        var allTests: [Test] {
            return [
                ("testThatPasses", testThatPasses),
                ("testThatDoesNotPass", testThatDoesNotPass)
            ]
        }
        
        func testThatPasses() {
            PlaygroundTesting.XCTAssertTrue(1 == 1)
        }
        
        func testThatDoesNotPass() {
            PlaygroundTesting.XCTAssertEqual(1, 2)
        }
    }
    
    override func spec() {
        
        describe("TestCases can be initialized and") {
            
            let testCase = MyTestCase()
            expect(testCase).to(beTruthy())
            
            it("can be executed") {
                let (successes, failures) = testCase.invokeTestsWithReturnTuple()
                expect(successes.count + failures.count) == testCase.allTests.count
            }
        }
        
    }
    
}
