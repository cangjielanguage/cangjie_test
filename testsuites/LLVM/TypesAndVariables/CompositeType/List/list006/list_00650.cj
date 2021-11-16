// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args  2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func test(): Int64 {
    var a : List<Int64> = [1,2,3]
    return a[3]
}

func main(): Int64 {
    test()
}
