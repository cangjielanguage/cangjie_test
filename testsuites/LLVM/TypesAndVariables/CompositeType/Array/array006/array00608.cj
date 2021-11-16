// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a : Array<Array<Array<Int64>>> = @{@{@{1,1}}}
    let res : Int64 = 2
    if (a[0][0].size != res) {
        return Int64(a.size)
    }
    return 0
}
