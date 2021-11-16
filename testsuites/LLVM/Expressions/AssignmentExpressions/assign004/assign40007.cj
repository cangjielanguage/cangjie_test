// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i : Int64 = 4
    i++
    if (i != Int64(5)) {
        return 1
    }
    i--
    if (i != Int64(4)) {
        return 2
    }
    return 0
}
