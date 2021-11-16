// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// interface中重载
interface I {
    operator func [](index: Int64, value:Int64): Unit{
        ()
    }
}

class A <: I{}

func main(): Int64{
    // I[2] = 4
    var a = A()
    a[2] = 4
    return 0
}