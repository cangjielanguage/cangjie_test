// EXEC: %compiler %cmp_opt  %n.cj   -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var listf64: ListFloat64 = ListFloat64(2,20.0)
    listf64.removeAt(1)
    var list2 = listf64.removeAt(1)
    if (list2.count() == 1 &&  list2.get(0) == 20.0) {
        return 0
    }
    return 1
}
