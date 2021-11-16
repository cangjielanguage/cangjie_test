// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = 1
var b = Ok(2)
var c = Err<Int64>(A())

func test():Result<Int64>{
    var x = b??c!
    return b
}

func main(): Int64 {
    return (test()??0) - 2
}
