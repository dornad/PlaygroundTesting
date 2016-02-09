// https://github.com/Quick/Quick

import Quick
import Nimble
import PlaygroundTesting

let okMessage = "✅"
let failMessage = "❌"

class AssertsSpec: QuickSpec {
    
    /// A util function that returns a value (or nothing).  Used to test XCTAssertNil
    private func stringWhenNumberIsEven(number:Int) -> String? {
        if number % 2 == 0 {
            return "\(number) is even."
        }
        else {
            return nil
        }
    }
    
    override func spec() {
        
        describe("Assertions should return true") {
            
            it("XCTAssert should work as expected") {
                let assertion = PlaygroundTesting.XCTAssert( 1 == 1 )
                expect( assertion ) == okMessage
            }
            
            context("XCTAssertEqual should work with") {
                
                it("Expressions that return Equatable types") {
                    let assertion = PlaygroundTesting.XCTAssertEqual(1, 1 )
                    expect( assertion ) == okMessage
                }
                
                it("Expressions that return ArraySlice<T> where T is Equatable") {

                    let slice:ArraySlice<Int> = [1,2,3,4][0..<2]
                    let anotherSlice:ArraySlice<Int> = [1,2,3,4,5,6,6][0..<2]
                    
                    let assertion = PlaygroundTesting.XCTAssertEqual(slice, anotherSlice)
                    expect( assertion ) == okMessage
                }
                
                it("Expressions that return [T] where T is Equatable") {
                    let value = [1,2,3,4]
                    let assertion = PlaygroundTesting.XCTAssertEqual(value, [1,2,3,4])
                    expect( assertion ) == okMessage
                }
                
                it("Expressions that return [T: U] where T and U are Equatable") {
                    let value = [ "One": 1, "Two": 2]
                    let assertion = PlaygroundTesting.XCTAssertEqual(value, [ "One": 1, "Two": 2])
                    expect( assertion ) == okMessage
                }
            }
            
            it("XCTAssertFalse should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertFalse(1 == 2)
                expect( assertion ) == okMessage
            }
            
            it("XCTAssertGreaterThan should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertGreaterThan(2, 1)
                expect( assertion ) == okMessage
            }
            
            context("XCTAssertGreaterThanOrEqual should work as expected when") {
                
                it("values are not the same") {
                    let assertion = PlaygroundTesting.XCTAssertGreaterThanOrEqual(2, 1)
                    expect( assertion ) == okMessage
                }
                
                it("values are the same") {
                    let assertion = PlaygroundTesting.XCTAssertGreaterThanOrEqual(2, 2)
                    expect( assertion ) == okMessage
                }
            }
            
            it("XCTAssertLessThan should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertLessThan(1, 2)
                expect( assertion ) == okMessage
            }
            
            context("XCTAssertLessThanOrEqual should work as expected when") {
                
                it("values are not the same") {
                    let assertion = PlaygroundTesting.XCTAssertLessThanOrEqual(1, 2)
                    expect( assertion ) == okMessage
                }
                
                it("values are the same") {
                    let assertion = PlaygroundTesting.XCTAssertLessThanOrEqual(2, 2)
                    expect( assertion ) == okMessage
                }
            }
            
            it("XCTAssertNil should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertNil( self.stringWhenNumberIsEven(5) )
                expect( assertion ) == okMessage
            }
            
            context("XCTAssertNotEqual should work with") {
                
                it("Expressions that return Equatable types") {
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(1, 2)
                    expect( assertion ) == okMessage
                }
                
                it("Expressions that return ArraySlice<T> where T is Equatable") {
                    let value = [1,2,3,4]
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(value[0..<2], [3,2,1])
                    expect( assertion ) == okMessage
                }
                
                it("Expressions that return [T] where T is Equatable") {
                    let value = [1,2,3,4]
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(value, [4,3,2,1])
                    expect( assertion ) == okMessage
                }
                
                it("Expressions that return [T: U] where T and U are Equatable") {
                    let value = [ "One": 1, "Two": 2]
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(value, [ "Three": 3, "Four": 4])
                    expect( assertion ) == okMessage
                }
            }
            
            it("XCTAssertNotNil should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertNotNil( self.stringWhenNumberIsEven(2) )
                expect( assertion ) == okMessage
            }
            
            it("XCTAssertTrue should work as expected") {
                let value = 1
                let assertion = PlaygroundTesting.XCTAssertTrue( value == 1)
                expect( assertion ) == okMessage
            }
            
            context("XCTFail should work as expected when") {
                
                it("There is no failure message") {
                    let assertion = PlaygroundTesting.XCTFail()
                    expect( failMessage ) == assertion
                }
                
                it("there is a failure message") {
                    let expectedMessage = "This failed"
                    let expectedAssertion = failMessage + expectedMessage

                    let assertion = PlaygroundTesting.XCTFail( expectedMessage )
                    expect( expectedAssertion ) == assertion
                }
            }
        }
        
        describe("Assertions should return false when conditions are not met") {
            
            it("XCTAssert should work as expected") {
                let assertion = PlaygroundTesting.XCTAssert( 1 == 2 )
                expect( assertion ) == failMessage
            }
            
            context("XCTAssertEqual should work with") {
                
                it("Expressions that return Equatable types") {
                    let assertion = PlaygroundTesting.XCTAssertEqual(1, 2)
                    expect( assertion ) == failMessage
                }
                
                it("Expressions that return ArraySlice<T> where T is Equatable") {
                    
                    let slice:ArraySlice<Int> = [0,1,2,3,4][0..<2]
                    let anotherSlice:ArraySlice<Int> = [1,2,3,4,5,6,6][0..<2]
                    
                    let assertion = PlaygroundTesting.XCTAssertEqual(slice, anotherSlice)
                    expect( assertion ) == failMessage
                }
                
                it("Expressions that return [T] where T is Equatable") {
                    let value = [0, 1,2,3,4]
                    let assertion = PlaygroundTesting.XCTAssertEqual(value, [1,2,3,4])
                    expect( assertion ) == failMessage
                }
                
                it("Expressions that return [T: U] where T and U are Equatable") {
                    let value = [ "One": 1, "Two": 2]
                    let assertion = PlaygroundTesting.XCTAssertEqual(value, [ "Three": 1, "Four": 2])
                    expect( assertion ) == failMessage
                }
            }
            
            it("XCTAssertFalse should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertFalse(1 == 1)
                expect( assertion ) == failMessage
            }
            
            context("XCTAssertGreaterThan should work as expected") {
                
                it("fail when elements are less than") {
                    let assertion = PlaygroundTesting.XCTAssertGreaterThan(1, 2)
                    expect( assertion ) == failMessage
                }
                
                it("fail when elements are equal") {
                    let assertion = PlaygroundTesting.XCTAssertGreaterThan(1, 1)
                    expect( assertion ) == failMessage
                }
            }
            
            it("XCTAssertGreaterThanOrEqual should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertGreaterThanOrEqual(1, 2)
                expect( assertion ) == failMessage
            }
            
            it("XCTAssertLessThanOrEqual should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertLessThanOrEqual(2, 1)
                expect( assertion ) == failMessage
            }
            
            context("XCTAssertLessThanOrEqual should work as expected when") {
                
                it("values are the same") {
                    let assertion = PlaygroundTesting.XCTAssertLessThanOrEqual(1, 1)
                    expect( assertion ) == failMessage
                }
                
                it("values are greater than") {
                    let assertion = PlaygroundTesting.XCTAssertLessThanOrEqual(2, 1)
                    expect( assertion ) == failMessage
                }
            }
            
            it("XCTAssertNil should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertNil( self.stringWhenNumberIsEven(2) )
                expect( assertion ) == failMessage
            }
            
            context("XCTAssertNotEqual should work with") {
                
                it("Expressions that return Equatable types") {
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(1, 1 )
                    expect( assertion ) == failMessage
                }
                
                fit("Expressions that return ArraySlice<T> where T is Equatable") {
                    
                    let slice:ArraySlice<Int> = [1,2,3,4][0..<2]
                    let anotherSlice:ArraySlice<Int> = [1,2,3,4,5,6,6][0..<2]
                    
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(slice, anotherSlice)
                    expect( assertion ) == failMessage
                }
                
                it("Expressions that return [T] where T is Equatable") {
                    let value = [1,2,3,4]
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(value, [1,2,3,4])
                    expect( assertion ) == failMessage
                }
                
                it("Expressions that return [T: U] where T and U are Equatable") {
                    let value = [ "One": 1, "Two": 2]
                    let assertion = PlaygroundTesting.XCTAssertNotEqual(value, [ "One": 1, "Two": 2])
                    expect( assertion ) == failMessage
                }
            }
            
            it("XCTAssertNotNil should work as expected") {
                let assertion = PlaygroundTesting.XCTAssertNotNil( self.stringWhenNumberIsEven(3) )
                expect( assertion ) == failMessage
            }
            
            it("XCTAssertTrue should work as expected") {
                let value = 1
                let assertion = PlaygroundTesting.XCTAssertTrue( value == 2)
                expect( assertion ) == okMessage
            }
            
            context("XCTFail should work as expected when") {
                
                it("There is no failure message") {
                    let assertion = PlaygroundTesting.XCTFail()
                    expect( failMessage ) == assertion
                }
                
                it("there is a failure message") {
                    let expectedMessage = "This failed"
                    let expectedAssertion = failMessage + expectedMessage
                    
                    let assertion = PlaygroundTesting.XCTFail( expectedMessage )
                    expect( expectedAssertion ) == assertion
                }
            }
        }
    }
}
