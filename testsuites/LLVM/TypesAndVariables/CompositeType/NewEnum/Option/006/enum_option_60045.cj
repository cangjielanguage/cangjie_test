// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Option<Int64>{
    var b = 1
    var x : ?Int64 = if (true){b}else{b}
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
