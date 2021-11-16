// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func main(): Int64 {
    let a = Array<Int32>(1,1)
    let b = a[-1]
    return 1
}
