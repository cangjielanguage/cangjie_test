// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    let a = @{1,1,1}
    let res : Int64 = 3
    if (a.size != res) {
        return 1
    }
    return 0
}
