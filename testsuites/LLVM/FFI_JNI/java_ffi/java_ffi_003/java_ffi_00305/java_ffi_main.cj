import java.lang.Object

interface CJClass {
    func test(input: Int32): Int32
}

class CJClass1 <: java.lang.Object & CJClass {
    func test(input: Int32): Int32 {
        print("in CJClass1\n")
        return input
    }
}
