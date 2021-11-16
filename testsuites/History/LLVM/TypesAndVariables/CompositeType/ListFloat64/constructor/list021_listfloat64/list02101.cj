// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var listZero: ListFloat64 = ListFloat64()
    if (listZero.count() != 0) {
        return 1
    }
    return 0
}
