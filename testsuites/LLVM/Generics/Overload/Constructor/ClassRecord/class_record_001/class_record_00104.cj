// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_first
// ASSERT: scan B_first

open class Father{}
class Child <: Father{}

class A{
    init(a:Child){print("A_first")}
    init(a:Father){print("A_second")}
}

record B{
    init(a:Child){print("B_first")}
    init(a:Father){print("B_second")}
}

func main():Int64{
    var i = A(Child())
    var j = B(Child())
    return 0
}