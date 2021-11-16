// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var A = {x:Int64=>Some(Some(1))}
var b = 0
var C = {x:Int64=>Some(1)}
var d = 0

func test():Option<Int64>{
    var a : ?(Int64) -> Option<Option<Int64>> = A
    var c : ?(Int64) -> Option<Int64> = C
    a?(b) ?? c?(d)
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
