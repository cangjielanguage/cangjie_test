// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_first
// ASSERT: scan B_first
class A<X,Y>{
    init(a:X){print("A_first")}
    init(a:Y){print("A_second")}
}

record B<X,Y>{
    init(a:X){print("B_first")}
    init(a:Y){print("B_second")}
}

func main():Int64{
    var i = A<Int64,Int32>(1)
    var j = B<Int64,Int32>(1)
    return 0
}