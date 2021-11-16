// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = 1
var b = Err<Bool>(A())



func test():Option<Int64>{
    b??a>a
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
