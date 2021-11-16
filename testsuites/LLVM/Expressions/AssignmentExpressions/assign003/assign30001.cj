// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l_a : Int32 = 4
    l_a++
    if (l_a != Int32(5)) {
        return 1
    }
    l_a--
    if (l_a != Int32(4)) {
        return 2
    }
    return 0
}
