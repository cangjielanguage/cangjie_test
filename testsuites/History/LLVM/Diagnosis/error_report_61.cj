// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


var map = #{1,2:1,1}// EXPECTED: regex 'key : value' expression is unexpected in set literal

func main():Int64 {
    return 0
}
