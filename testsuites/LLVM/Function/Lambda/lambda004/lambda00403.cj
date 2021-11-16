// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
let test : Int64 = 1
func main(): Int64 {
    let lambda = { a: Int64 => test - a}
    return lambda(1)
}
