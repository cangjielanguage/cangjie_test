// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i : Float16 = 4.0
    i++
    if (i != Float16(5)) {
        return 1
    }
    i--
    if (i != Float16(4)) {
        return 2
    }
    return 0
}
