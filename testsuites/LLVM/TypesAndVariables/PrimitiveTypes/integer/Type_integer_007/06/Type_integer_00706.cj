// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected type

func main(): Int64 {
    let int64_One: in%t64 = 127

    if (int64_One == 127) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
