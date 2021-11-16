package test

import java.lang.*

external open class InteropTest <: java.lang.Object {
    public open func test(): Unit { }
}

external open class InteropTest2 <: InteropTest {
    public override open func test(): Unit { }
}
