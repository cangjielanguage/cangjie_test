// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_second
// ASSERT: scan B_second

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
    var i = X( {  => B()})
    var j = Y( {  => B()})
    return 0
}