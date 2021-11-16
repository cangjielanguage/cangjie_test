// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var c =1
    let a = @{1,0}
    c = a[1 * 1]
    return c
}
