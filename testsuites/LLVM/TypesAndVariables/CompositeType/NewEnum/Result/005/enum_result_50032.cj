// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var A = {x:Int64=>Some(Ok(1))}
var b = 0
var C = {x:Int64=>Ok(1)}
var d = 0

func test():Result<Int64>{
    var a : ?(Int64) -> Option<Result<Int64>> = A
    var c : ?(Int64) -> Result<Int64> = C
    a?(b) ?? c?(d)
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
