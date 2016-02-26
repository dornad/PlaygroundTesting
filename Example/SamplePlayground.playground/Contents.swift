//:
//: ## PlaygroundTesting 
//: Write your Unit Tests in a Playground
//:
import UIKit
import PlaygroundTesting
/*:

### Important: 

To import PlaygroundTesting, follow the instructions here: https://developer.apple.com/library/ios/recipes/Playground_Help/Chapters/ImportFramework.html
*/

/*:
## Assertions
With PlaygroundTesting, you can use `Assertions` directly on the Playground:

- Similar Syntax:  PlaygroundTesting uses the same naming convention as `XCTest`, so all the Assert functions you know are availabkle.
- When an Assertion evaluates to `true`, it will render as "✅"
- When it doesn't, it will render as "❌"
  - It will also print failure comments:  like "❌ cannot be false"
*/

XCTAssertTrue(true)

XCTAssertTrue(false, "Expected a true value.")

/*:
## TestCase classes

With PlaygroundTesting, allows you to write `Test Cases` as well.

- Similar Syntax:  `XCTestCase` converts to `TestCaseProtocol`
*/

class TestCase: TestCaseProtocol {
    
    /// Unlike `XCTest` in Xcode, Swift still doesn't have full reflection, which 
    /// forces us to add a `property` that contains the available tests in your test case.
    var allTests: [Test] {
        return [
            ("testThatPasses", testThatPasses),
            ("testThatDoesNotPass", testThatDoesNotPass)
        ]
    }
    
    func testThatPasses() {
        XCTAssertTrue(1 == 1)
    }
    
    func testThatDoesNotPass() {
        XCTAssertEqual(1, 2, "Still doesn't understand equality")
    }
}
//: Executing the test case is two extra lines of code:

let testCase = TestCase()
testCase.invokeTests()
/*:

Unlike Xcode's `XCTest` (and much like `swift-corelibs-xctest`), you can name the test method whatever you want.  

You can enable and disable tests as needed.
*/

class TestCaseTwo: TestCaseProtocol {
    
    var allTests: [Test] {
        return [
            ("another test", lookNoTestPrefixHere),
            // ("failing test", testThatFails), // Uncomment to enable test
        ]
    }
    
    func lookNoTestPrefixHere() {
        
        XCTAssertTrue(true, "")
    }
    
    func testThatFails() {
        
        XCTAssertEqual(1, 2)
    }
}

let anotherTestCase = TestCaseTwo()
anotherTestCase.invokeTests()

/*:
By using `typealiases` and protocol extensions, you can write Test Cases that 
with `minimum` refactoring you can move into your Unit Tests:
*/

typealias XCTestCase = TestCaseProtocol

class XCTestCompatibleTestCase: XCTestCase {
    
    func testSomeValueShouldBeTrue() {        
        XCTAssertTrue(false, "Oops...")
    }    
}

extension XCTestCompatibleTestCase {
    
    var allTests: [Test] {
        return [
            ("another test", testSomeValueShouldBeTrue)
        ]
    }    
}

let someTestCase = XCTestCompatibleTestCase()
someTestCase.invokeTests()
