// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var a = 3
    var res = match (a) {
        case _ =>
            a**=3
            a
    }
    if (a==27) {
        return 0
    }
    return 1
}
