import java.lang.*
import java.lang.Throwable as JThrowable

@java
class Test {
    func test(): Unit {
        throw Throwable("throw in cangjie")
    }
}
