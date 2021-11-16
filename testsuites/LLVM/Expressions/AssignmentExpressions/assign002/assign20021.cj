// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : Array<Int32> = @{1}
    var r : Array<Int32> = @{2}
    var temp = r
    l = temp
    if (l[0] == r[0]) {
        return 0
    }
    return 1
}
