// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

package ;// EXPECTED: regex expected package name after 'package'

func main():Int64 {
    return 0
}

