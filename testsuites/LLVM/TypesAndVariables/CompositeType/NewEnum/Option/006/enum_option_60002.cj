// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var c = Some(1)
var d = 1

func test():Option<Int64>{
    var x : ?Int64 = c??d
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
