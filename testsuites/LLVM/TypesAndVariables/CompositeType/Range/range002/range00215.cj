// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a : Array<Int64> = @{0,1,2,3,4,5,6,7,8,9}
    if (a[9..-1:Int64(-1)][0] != 9) {
        return 1
    }
    for (i in a[9..-1:Int64(-1)]) {
        if (a[9..-1:Int64(-1)][i] != 9-i) {
            return 2
        }
    }
    return 0
}
