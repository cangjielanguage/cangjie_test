// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var c : Int64 = 1
    let a : Array<Int64> = @{1,0}
    c = a[c]
    return c
}
