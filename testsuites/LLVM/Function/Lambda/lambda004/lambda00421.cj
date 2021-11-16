// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
let lambda = { i: Int64 => i}


func main(): Int64 {
    return lambda(0)
}
