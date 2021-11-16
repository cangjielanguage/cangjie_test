// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var b = 1
    let a = @{@{1,0,1},@{1,1,1}}
    b = a[0][1]
    return b
}
