// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var a = @{0,1,2,3,4,5,6,7,8,9}
    let b = 0..10:Int64(2)
    var res = 0
    for (i in a[b]) {
        res = res + i
    }
    if (res == 20) {
        return 0
    }
    return 1
}
