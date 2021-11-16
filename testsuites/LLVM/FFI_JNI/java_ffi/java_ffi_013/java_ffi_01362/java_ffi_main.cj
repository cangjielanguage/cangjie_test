import java.lang.*
import java.lang.Throwable as JThrowable
from ffi import java.*

@java
class Test {
    func test1(): Unit {
        throw TestException(J"throw in cangjie")
    }

    func test2(): Unit {
        test1()
    }

    func test3(): Unit {
        test2()
    }

    func test4(): Unit {
        test3()
    }

    func test5(): Unit {
        test4()
    }
}

@java
class TestException <: Throwable {
    init(str: JString) {
        super(toString(str))
    }
}
