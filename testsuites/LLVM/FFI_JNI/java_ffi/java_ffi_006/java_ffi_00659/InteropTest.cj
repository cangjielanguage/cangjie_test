package test

import java.lang.*

@java
external open class InteropTest<T> {
    public var num: Int32 = 0
    public static var staticNum: Int32 = 0

    public func test(t: T): Unit {}

    public static func staticTest<M>(m: M): Unit {}
}
