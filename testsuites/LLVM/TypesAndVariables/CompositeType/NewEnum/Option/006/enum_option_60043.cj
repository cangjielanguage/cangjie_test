// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Option<Int64>{
    var a = 1
    var x : ?Int64 = a
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
