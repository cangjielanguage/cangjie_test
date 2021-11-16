// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I{}

enum A <: I{
    a
}

func test(i:I){0}

func main(): Int64 {
    var i = A.a
    return test(i)
}
