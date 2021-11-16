// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = 1
var b = Some(2)
var c = Err<Int64>(A())

func test():Result<Int64>{
    var x = b??c!
    return Ok(2)
}

func main(): Int64 {
    return (test()??0) - 2
}
