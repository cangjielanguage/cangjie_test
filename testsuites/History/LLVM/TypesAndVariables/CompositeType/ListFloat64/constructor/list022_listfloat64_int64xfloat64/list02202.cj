// EXEC: %compiler %cmp_opt  %n.cj  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var listf64: ListFloat64 = ListFloat64(0,10.0)
    if (listf64.count() == 0) {
             return 0
        }
    return 1
}
