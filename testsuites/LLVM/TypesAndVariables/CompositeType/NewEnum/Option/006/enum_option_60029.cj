// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var c = Ok<Int64>(1)

func test():Result<Int64>{
    var x : ?Int64 = c!
    return Ok(2)
}

func main(): Int64 {
    return (test()??0) - 2
}
