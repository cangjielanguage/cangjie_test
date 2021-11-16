// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}

class Child <: Father{}

func test(): Int64 {
    var x : Father = Father()
    var y : Child = Child()
    var z = [x,y]
    return z.size() - 2
}

func main(): Int64 {
    return test()
}
