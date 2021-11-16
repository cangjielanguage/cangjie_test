// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class A{}
open class C <: A{}
open class E <: C{}

open class B{}
open class D <: B{}
open class F <: D{}

class X{
init(inp:A*D){print("A_first")}
init(inp:C*B){print("A_second")}
}

record Y{
init(inp:A*D){print("B_first")}
init(inp:C*B){print("B_second")}
}


func main():Int64{
var i = X((E(),F())) // EXPECTED: regex ambiguous match for constructor call
var j = Y((E(),F())) // EXPECTED: regex ambiguous match for constructor call
return 0
}
