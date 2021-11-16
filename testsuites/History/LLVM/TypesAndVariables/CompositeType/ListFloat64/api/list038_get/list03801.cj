// EXEC: %compiler %cmp_opt  %n.cj    -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var listf64: ListFloat64 = ListFloat64(2,20.0)
    if (listf64.get(1) == 20.0) {
        return 0
    }
    return 1
}
