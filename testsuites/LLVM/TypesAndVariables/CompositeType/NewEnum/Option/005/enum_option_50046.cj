// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Option<Int64>{
    var a = Some(1)
    var b = 1
    match (1){case _ => a}??match (1){case _ => b}
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
