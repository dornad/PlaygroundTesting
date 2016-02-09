//
//  AssertThrowTests.swift
//  PlaygroundTesting
//
//  Created by Daniel Rodriguez on 2/8/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import XCTest
import func PlaygroundTesting.XCTAssertThrowsError

class AssertThrowTests: XCTestCase {
    
    let errorExplanation = "Your value should be true."
    
    enum MyTestingError: ErrorType {
        case ThisIsAnError
        case ThisIsAnErrorWithAnExplanation(String)
    }
    
    func test_assertThrow_for_any_Error() {
        let assertion = PlaygroundTesting.XCTAssertThrowsError( try throwError(true) )
        XCTAssertTrue(assertion == okMessage)
    }
    
    func test_assertThrow_for_Specific_Error() {
        
        let a = PlaygroundTesting.XCTAssertThrowsError(try throwError(true, detailedError: true)) { error in
            self.checkCapturedError(error)
        }
        XCTAssertTrue(a == okMessage)
    }
}

extension AssertThrowTests {
    
    func throwError(value:Bool, detailedError:Bool = false) throws {
        if value {
            if detailedError {
                throw MyTestingError.ThisIsAnErrorWithAnExplanation(errorExplanation)
            }
            else {
                throw MyTestingError.ThisIsAnError
            }
        }
    }
    
    func checkCapturedError(error: ErrorType, file:StaticString = __FILE__, line:UInt = __LINE__) {
        
        guard let err = error as? MyTestingError else {
            XCTFail("Not the correct ErrorType subtype.", file:file, line:line)
            return
        }
        
        switch err {
            
        case .ThisIsAnError:
            XCTFail("Not the correct error case.", file:file, line:line)
        
        case .ThisIsAnErrorWithAnExplanation(let explanation):
            XCTAssertEqual(explanation, errorExplanation, "Unexpected explanation.", file:file, line:line)
        }
    }
}
