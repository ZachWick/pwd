import XCTest

import pwdTests

var tests = [XCTestCaseEntry]()
tests += pwdTests.allTests()
XCTMain(tests)
