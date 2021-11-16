// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = Ok(Ok(Ok(1)))
var b = Ok(Ok(1))
var c = Ok(1)
var d = 1

func test():Result<Int64>{
    c??c??c??d // (c??(c??(c??d)))
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
