import java.lang.*
import java.lang.RuntimeException as JRuntimeException

@java
class Test {
    func test(): Unit {
        throw RuntimeException("throw in cangjie")
    }
}
