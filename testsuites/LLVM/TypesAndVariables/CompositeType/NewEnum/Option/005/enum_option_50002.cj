// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = Some(Some(Some(1)))
var b = Some(Some(1))
var c = Some(1)
var d = 1

func test():Option<Int64>{
    c??c??c??d // (c??(c??(c??d)))
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
