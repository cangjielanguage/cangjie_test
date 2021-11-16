// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'INT64'

func main(): Int64 {
    let int64_One: INT64 = 127
}