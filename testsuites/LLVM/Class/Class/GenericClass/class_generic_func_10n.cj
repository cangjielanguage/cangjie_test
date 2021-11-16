// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    open func foo(x: T, y: T): T{
        return x
    }
}

class Data<T> <: Base<T> {
    init(x: T){}
    func foo(x: Int32, y: Int32): Int32{
        var result: Int32 = x + y
        return result
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>(3) // EXPECTED: regex error.*?instantiation 'Data<Int32>' causes ambiguous functions named 'foo' between declaration 'Data<Int32>' and declaration 'Base<Int32>'
    var a = data.foo(3,4)
    if (a != 7) {return 1}
    return 0
}
