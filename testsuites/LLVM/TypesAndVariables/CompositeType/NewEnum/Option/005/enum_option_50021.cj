// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = 1
var b = Some(1)

func test():Int64{
    var x = b??a-a
    return x
}

func main(): Int64 {
    return test() - 1
}
