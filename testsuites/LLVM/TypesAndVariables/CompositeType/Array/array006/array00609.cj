// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a = Array<Int64>(5,5)
    let res : Int64 = 5
    if (a.size != res) {
        return Int64(a.size)
    }
    return 0
}
