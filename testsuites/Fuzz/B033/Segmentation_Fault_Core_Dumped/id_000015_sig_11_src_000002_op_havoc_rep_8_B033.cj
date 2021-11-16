// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func iain():Int64{
    var arr1 = @{1, # foo<int64r res # fosize
unc
    if res == 3 {
        return 0
    }
    return 1
}
