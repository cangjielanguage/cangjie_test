// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'UINT32'

func Type_integer_00110(): int {
    let uint32_One: UINT32 = 127
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
