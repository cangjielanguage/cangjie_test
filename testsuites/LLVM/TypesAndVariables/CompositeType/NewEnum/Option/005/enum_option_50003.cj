// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = true
var b = Err<Bool>(A())



func test():Option<Int64>{
    b??a||a // calculate a||a first
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
