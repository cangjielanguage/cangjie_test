// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = 1
var b = Some(())

func test():Int64{
    var x = b??a++
    return 2
}

func main(): Int64 {
    return test() - 2
}
