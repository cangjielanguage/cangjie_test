// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}

class Child_a <: Father{}

class Child_b <: Father{}

func test(): Int64 {
    var x : Child_a = Child_a()
    var y : Child_b = Child_b()
    var z = [x,y]
    return z.size() - 2
}

func main(): Int64 {
    return test()
}
