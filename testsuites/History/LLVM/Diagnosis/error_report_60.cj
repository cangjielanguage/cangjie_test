// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


var map = #{1:2,1}// EXPECTED: regex 'key : value' expression is expected in map literal

func main():Int64 {
    return 0
}
