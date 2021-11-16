// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I{}

class C <: I{}

func test(): Int64 {
var a : List<I> = [C()]
var b : List<I> = List<I>(a.toArray())
var c : List<I> = List<I>(Array<I>(1,C()))
return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
return test()
}
