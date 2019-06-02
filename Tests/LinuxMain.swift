import XCTest
@testable import IdiomsTests

XCTMain([
    testCase(ControlFlowTests.allTests),
    testCase(TimesTests.allTests),
    testCase(IterableRandomAccessCollectionTests.allTests),
    testCase(RandomAccessMutableCollectionTests.allTests),
    testCase(ContainsTests.allTests),
    testCase(PrependingTests.allTests),
    testCase(ForLoopTests.allTests),
    testCase(StringProtocolSubscriptTests.allTests),
    ])
