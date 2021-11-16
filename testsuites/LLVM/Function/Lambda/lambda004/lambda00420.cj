// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var test : Int64 = 1
let lambda = { i: Int64 => test - i}


func main(): Int64 {
    return lambda(1)
}
