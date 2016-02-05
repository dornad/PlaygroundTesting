// https://github.com/Quick/Quick

import Quick
import Nimble
import PlaygroundTesting

class AssetsSpec: QuickSpec {
    override func spec() {
        
        describe("Assertions should return true") {
            
            it("XCTAssert should work as expected") {
                
                let assertion = XCTAssert( 1 == 1 )
                expect( Asserts.okMessage ) == assertion
                
            }
            
            
        }
    }
}
