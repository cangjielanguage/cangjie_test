// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Option<Int64>{
    Some(1)??0
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
