// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base {
    static protected func foo(x:Int32):Int32{
        return x
    }
}

class Data <: Base {
}

func run(): Int64 {
    var res1: Int32 = Base.foo(1); // EXPECTED: regex no matching function declaration for function call
    var res2: Int32 = Data.foo(2) // EXPECTED: regex no matching function declaration for function call
    if (res1 != 1 || res2 != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
