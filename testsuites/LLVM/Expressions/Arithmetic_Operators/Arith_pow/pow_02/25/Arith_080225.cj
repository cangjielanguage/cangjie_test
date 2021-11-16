// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan inf

func main(): Int64 {
    let a: Float32 =  1.7e38 * 2.1
    print("${a}")
    return 0
}
