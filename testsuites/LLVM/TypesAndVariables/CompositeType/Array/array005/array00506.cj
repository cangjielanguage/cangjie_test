// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a = @{@{0,0,0},@{1,1,1}}
    let b = a[0]
    return b[0]
}
