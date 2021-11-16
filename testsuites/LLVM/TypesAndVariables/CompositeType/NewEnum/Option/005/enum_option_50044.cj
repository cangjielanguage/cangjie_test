// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func a<T>(){}

func test():Option<Int64>{
    Some(a<Int64>)??a<Int64>
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
