// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


var a = 1

func test():Option<Int64>{
    var x : ?Int64 = a+a
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
