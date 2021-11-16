// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a = 2147483647
    let b: Int64 = a + 5

    return 0
}