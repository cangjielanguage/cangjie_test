import java.lang.*

@java
interface CJInterface {
    func test(): Unit {
        var a: Unit = ()
        print("in CJInterface\n")
        return a
    }
}

@java
class CJClass <: CJInterface {}
