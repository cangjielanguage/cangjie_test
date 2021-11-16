// EXEC: %compiler %cmp_opt  %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let rows: Int64
    var listf64: ListFloat64 = ListFloat64(rows,10) // EXPECTED: regex variable 'rows' is used before initialization
    if (listf64.count() != 0) {
             return 1
        }
    return 0
}
