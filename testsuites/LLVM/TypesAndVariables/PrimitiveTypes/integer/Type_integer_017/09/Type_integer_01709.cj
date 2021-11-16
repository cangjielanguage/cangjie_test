// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'UINT64'

func main(): Int64 {
    let uint64_One: UINT64 = 127
    return 0
}
