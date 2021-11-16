package test

import java.lang.*

@java
external class InteropTest<T> {
    var num: T
    init(value: T) { this.num = value }
    func get(): T { return num }
    func test(value: T): Unit {}
}
