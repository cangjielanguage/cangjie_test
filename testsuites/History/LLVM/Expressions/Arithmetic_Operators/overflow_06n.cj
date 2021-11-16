// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

func main(): Int64 {
    var i:Int32 = 2147483647
    i++     // EXPECTED: regex xxxx
    i--
    if (i == 2147483647) {
        return 0
    }
    return 1
}
