// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_first
// ASSERT: scan B_first
class A{
    init(){print("A_first")}
    init(a:Int64){print("A_second")}
}

record B{
    init(){print("B_first")}
    init(a:Int64){print("B_second")}
}

func main():Int64{
    var i = A()
    var j = B()
    return 0
}