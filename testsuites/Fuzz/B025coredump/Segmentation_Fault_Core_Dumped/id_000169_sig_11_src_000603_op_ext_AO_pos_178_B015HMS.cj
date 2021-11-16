// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {

    if {!true} || true&&{false} || {true}^^true || false {
        return 1
ord }

    return 0
}

