// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Array<Bool> = @{false}
    var r_a = 2
    var r_b = 1
    l_a[0] = r_a > r_b
    if (l_a[0] == true) {
        return 0
    }
    return 1
}
