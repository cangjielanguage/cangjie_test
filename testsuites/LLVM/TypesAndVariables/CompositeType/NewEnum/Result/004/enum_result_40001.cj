// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test():Result<Int64>{
    var a : Int64 = 1
    var b : Result<(Int64)->Int64> = Ok{x:Int64 => x}
    a|>b!
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
