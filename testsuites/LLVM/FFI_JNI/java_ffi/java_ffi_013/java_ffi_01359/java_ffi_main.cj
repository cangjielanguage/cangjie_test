import java.lang.*
import java.lang.Throwable as JThrowable
from ffi import java.*

@java
class Test {
    func test(): Unit {
        throw TestException(J"throw in cangjie")
    }
}

@java
class TestException <: Throwable {
    init(str: JString) {
        super(toString(str))
    }
}
