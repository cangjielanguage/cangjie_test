// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = 1
var b = 10
var c = Some(a..=b)

func test():Option<Int64>{
    c??a..=b
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
