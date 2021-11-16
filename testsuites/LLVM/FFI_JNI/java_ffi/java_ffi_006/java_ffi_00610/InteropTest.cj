package test

import java.lang.*

@java
external class InteropTest<T> {
    func test(value: T): Unit {}
}

@java
external class Test {
    var interoptest: InteropTest<java.lang.Object>
    init(interoptest: InteropTest<java.lang.Object>) { this.interoptest = interoptest }
}
