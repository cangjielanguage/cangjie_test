// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_second
// ASSERT: scan B_second

open class A{}
open class B <: A{}
class C <: B{}


class X{
    init(a:A){print("A_first")}
    init(a:B){print("A_second")}
}

record Y{
    init(a:A){print("B_first")}
    init(a:B){print("B_second")}
}

func main():Int64{
    var i = X(C())
    var j = Y(C())
    return 0
}