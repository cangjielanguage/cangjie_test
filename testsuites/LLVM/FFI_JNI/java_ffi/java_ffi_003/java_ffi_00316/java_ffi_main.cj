import java.lang.Object

abstract class CJClass <: java.lang.Object {
    open func test(): Unit {
        print("in CJClass\n")
    }
}

class Child <: CJClass {
    func testChild(): Unit {
        print("in Child\n")
    }
}
