// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

package p1
var a = 1
func main():Int64 {
    p1.a = 2
    return 0
}
