// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {

    var a : List<Int8> = [1,{2}]

    if a.size() !=2 || a[{0}] != 1 || a[1] != 2 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace