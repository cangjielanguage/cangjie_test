// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Int32 = 4
    var r_a : Int32 = 1
    var r_b : Int32 = 1
    r_a--
    r_a++
    l_a--
    l_a++
    l_a = r_a+r_b
    l_a--
    l_a++
    if (l_a == Int32(2)) {
        return 0
    }
    return 1
}
