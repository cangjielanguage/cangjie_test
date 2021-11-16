import java.lang.*

interface CJClass {
    func test(input: Int32): Int32 {
        return input
    }
}

@java
class Child <: CJClass {}
