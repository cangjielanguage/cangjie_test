// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_second
// ASSERT: scan B_second
class A<T>{
    init(a:T){print("A_first")}
    init(a:Int64){print("A_second")}
}

record B<T>{
    init(a:T){print("B_first")}
    init(a:Int64){print("B_second")}
}

func main():Int64{
    var i = A<Int32>(1)
    var j = B<Int32>(1)
    return 0
}