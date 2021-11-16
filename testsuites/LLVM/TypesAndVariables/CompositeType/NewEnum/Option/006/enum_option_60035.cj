// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Option<Int64>{
    var a : ?String = "1"
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
