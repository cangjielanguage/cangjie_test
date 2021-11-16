// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Array<Int32> = @{4}
    var r_a : Int32 = 2
    var r_b : Int32 = 2
    l_a[0] = r_a|r_b
    if (l_a[0] == Int32(2)) {
        return 0
    }
    return 1
}
