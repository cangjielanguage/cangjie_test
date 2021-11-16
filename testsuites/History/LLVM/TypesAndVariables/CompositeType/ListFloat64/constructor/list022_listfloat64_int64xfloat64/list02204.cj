// EXEC: %compiler %cmp_opt  %n.cj  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let rows:Array<Int64> = @{2147483647}
    for (number in rows) {
        var listf64: ListFloat64 = ListFloat64(number,10.0)
        if (listf64.count() != number) {
            return 1
        }
    }
    return 0
}
