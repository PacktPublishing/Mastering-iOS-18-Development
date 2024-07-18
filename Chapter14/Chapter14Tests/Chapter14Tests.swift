import Testing
@testable import Chapter14

struct CounterViewModelTests {
    
    @Test("Test the incremenet function. Accepts 5 and expect 6. ") func testViewModelIncrement() async throws {
//         preparation
        let viewmodel = CounterViewModel()
        viewmodel.count = 5
        
//        execution
        viewmodel.increment(by: 1)
        
//        verification
        #expect(viewmodel.count == 6)
    }
    
    @Test("Test the decrement function.", .enabled(if: AppSettings.CanDecrement)) func testTheDecrementFunction() async throws {
        //         preparation
        let viewmodel = CounterViewModel()
        viewmodel.count = 5
        
        //        execution
        viewmodel.decrement(by: 1)
        
        //        verification
        #expect(viewmodel.count == 4)
    }
    
    @Test("Test the reset function", .tags(.critical)) 
    func testResetFunction() {
        //         preparation
        let viewmodel = CounterViewModel()
        viewmodel.count = 5
        
        //        execution
        viewmodel.reset()
        
        //        verification
        #expect(viewmodel.count == 0)
    }
    
}
