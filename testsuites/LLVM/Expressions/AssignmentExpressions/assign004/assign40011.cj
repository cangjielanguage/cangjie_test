// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i : Float64 = 4.0
    i++
    if (i != Float64(5)) {
        return 1
    }
    i--
    if (i != Float64(4)) {
        return 2
    }
    return 0
}
