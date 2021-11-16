// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var a = {x:(Int64)->Int64 => 1}
var b = Ok(a)
var c = {a:Int64 => a}
var d = c

func test():Result<Int64>{
    d|>b??a|>c // calculate ?? first.
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
