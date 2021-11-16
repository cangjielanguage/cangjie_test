// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var a = {x:Int64 => 1}
var b = 1
func test():Option<Int64>{
    var x : ?Int64 = b|>a
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
