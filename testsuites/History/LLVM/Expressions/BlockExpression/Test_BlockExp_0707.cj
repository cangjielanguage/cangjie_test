// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {

    var a : ArrayList<Int64> = ArrayList<Int64>([1,2,3].toArray())

    if a[0] != 1 || a[1] != 2 || a[2] != 3 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace