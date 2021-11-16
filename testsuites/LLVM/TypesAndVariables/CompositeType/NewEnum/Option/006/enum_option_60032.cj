// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



var C = {x:Int64=>1}
var d = 0

func test():Option<Int64>{
    var c : ?(Int64) -> Int64 = C
    var x : ??Int64 = c?(d)
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
