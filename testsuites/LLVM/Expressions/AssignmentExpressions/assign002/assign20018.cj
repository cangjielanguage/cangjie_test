// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : Int32*Int32 = (1,1)
    var r : Int32*Int32 = (2,2)
    var temp = r
    l = temp
    if (l != r) {
        return 1
    }
    if (l == r) {
        return 0
    }
    return 1
}
