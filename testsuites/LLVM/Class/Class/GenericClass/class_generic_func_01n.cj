// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
    var base: T
    init(x: T){
        base = x
    }

}

class Data<T> <: Base<T> {
    func foo(x: T): T{
        return x
    }
}

func main(): Int64 {
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.foo("abc")    // EXPECTED: regex no matching function declaration for function call
    return 0
}