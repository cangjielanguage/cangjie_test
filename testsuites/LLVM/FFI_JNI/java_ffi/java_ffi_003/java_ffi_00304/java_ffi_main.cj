import java.lang.Object

open class CJClass <: java.lang.Object {
  open func test(input: Int32): Int32 {
    print("in CJClass\n")
    return input
  }
}

class CJClass1 <: CJClass {
  func test1(input: Int32): Int32 {
    print("in CJClass1\n")
    return input
  }
}
