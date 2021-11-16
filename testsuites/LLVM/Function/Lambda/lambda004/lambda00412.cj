// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
let test : Int64 = 1
class C1{
    init(){}
    let lambda = { i: Int64 => test - i}
}

func main(): Int64 {
    return 0
}
