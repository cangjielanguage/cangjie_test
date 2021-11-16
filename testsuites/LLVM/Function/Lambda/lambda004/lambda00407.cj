// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let test : Int64 = 2
    let lambda = { i: Int64 => var test = 1;return test - i} // not use outside test.
    return lambda(1)
}
