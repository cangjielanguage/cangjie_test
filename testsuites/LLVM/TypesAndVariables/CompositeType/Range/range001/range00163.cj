// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a = Int32(1.1)..Int32(10.1):Int64(1.1)
    return 0
}
