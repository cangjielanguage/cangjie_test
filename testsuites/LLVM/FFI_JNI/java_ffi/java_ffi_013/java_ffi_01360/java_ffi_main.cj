import java.lang.*
import java.lang.Throwable as JThrowable
from ffi import java.*

@java
class Test {
    func test(num: Int32): Unit {
        if (num < 0) {
            throw TestException1(J"throw in cangjie")
        } else if (num == 0) {
            throw TestException2(J"throw in cangjie")
        } else {
            throw TestException3(J"throw in cangjie")
        }
    }
}

@java
class TestException1 <: Throwable {
    init(str: JString) {
        super(toString(str))
    }
}

@java
open class TestException2 <: Throwable {
    init(str: JString) {
        super(toString(str))
    }
}

@java
class TestException3 <: TestException2 {
    init(str: JString) {
        super(str)
    }
}
