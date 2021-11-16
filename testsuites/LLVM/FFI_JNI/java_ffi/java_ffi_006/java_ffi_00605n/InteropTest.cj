package test

import java.lang.*

@java
external open class InteropTest<T> {
    open func test(value: T): Unit {}
}

external class Child<T> <: InteropTest<T> { // EXPECTED: regex Class 'Child' should have '@java' annotation
    var num: T
    init(value: T) { this.num = value }
    func get(): T { return num }
    override func test(value: T): Unit {
        print("in Child\n")
        super.test(value)
    }
}
