// EXEC: %compiler %cmp_opt  %n.cj  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var listf64: ListFloat64 = ListFloat64(2,20.0)
    listf64.insert(30.0)
    var list1 = listf64.insert(40.0)
    if (list1.count() != 3 || list1.get(2) != 40.0) {
        return 1
    }
    return 0
}
