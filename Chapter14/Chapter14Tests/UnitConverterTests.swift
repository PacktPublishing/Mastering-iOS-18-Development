import Testing
@testable import Chapter14

let convertingTests: [(Double, Double)] = [(1.0, 1.09361), 
                                           (3.5, 3.827635)]

@Suite("Unit converter tests", .tags(.critical))
struct UnitConverterTests {
    
    @Suite("From meters to yards")
    struct FromMetersToYardsTests {
        @Test(arguments: convertingTests)
        func testConvertingMetersToYards(data: (Double, Double)) {
            #expect(UnitConverter.metersToYards(data.0) == data.1)
        }
    }    
}
