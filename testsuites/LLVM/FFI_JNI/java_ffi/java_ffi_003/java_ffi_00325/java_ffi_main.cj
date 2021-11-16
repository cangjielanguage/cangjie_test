import java.lang.Object
@java
open class CJClass <: java.lang.Object {
    public var num: Int32 = 0xaa

    open public func test(): Unit {
        print("in CJClass\n")
    }
}
@java
class Child <: CJClass {
    public var num: Int32 = 0xbb

    override public func test(): Unit {
        print("in Child\n")
    }
}
