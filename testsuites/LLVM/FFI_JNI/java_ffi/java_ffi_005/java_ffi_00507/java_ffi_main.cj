import java.lang.*

@java
interface CJInterface {
    func test(): Unit {
        print("in CJInterface\n")
    }
}

@java
class CJClass <: CJInterface {}
