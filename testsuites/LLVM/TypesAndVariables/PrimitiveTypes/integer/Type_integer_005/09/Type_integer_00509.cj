// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared type name 'INT32'

func Type_integer_00110(): Int8 {
    let int32_One: INT32 = 127
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
