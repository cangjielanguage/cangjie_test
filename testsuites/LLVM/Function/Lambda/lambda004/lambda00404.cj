// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
var test : Int64 = 2
func main(): Int64 {
    let lambda = { a: Int64 => test - a}
    return lambda(2)
}
