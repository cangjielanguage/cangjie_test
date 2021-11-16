// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
package test

import java.lang.*

external open class InteropTest <: java.lang.Object {
    public let num1: Int32 = 0
    public let num2: Int32 = 0

    public func test(input: Int32): Unit { /* compiled code */ } // EXPECTED: regex overridden function 'test' should have 'open' modifier
}
