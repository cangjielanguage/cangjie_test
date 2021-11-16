// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_first
// ASSERT: scan B_first

open class A{}
open class B <: A{}


class X{
    init(inp:()->A){print("A_first")}
    init(inp:()->B){print("A_second")}
}

record Y{
    init(inp:()->A){print("B_first")}
    init(inp:()->B){print("B_second")}
}


func main():Int64{
    var i = X( {  => A()})
    var j = Y( {  => A()})
    return 0
}