// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A_second
// ASSERT: scan B_second

open class A{}
open class C <: A{}
open class E <: C{}

open class B{}
open class D <: B{}
open class F <: D{}

class X{
    init(inp:A*B){print("A_first")}
    init(inp:C*D){print("A_second")}
}

record Y{
    init(inp:A*B){print("B_first")}
    init(inp:C*D){print("B_second")}
}


func main():Int64{
    var i = X((E(),F()))
    var j = Y((E(),F()))
    return 0
}