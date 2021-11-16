import java.lang.Object

class CJClass <: java.lang.Object {
    public var num: Int32 = 0xaa

    public open func test(): Unit {
        print("in CJClass\n")
    }
}
