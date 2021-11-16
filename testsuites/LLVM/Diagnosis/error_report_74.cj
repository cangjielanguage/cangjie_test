// EXEC-PIPE-1:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64 {
    var tp1 = (1,'a')
    var tp2 = (3,4,5)
    var tp3 = tp1==tp2 // EXPECTED: regex operator '==' between tuple type 'Tuple<Int64, Char>' and 'Tuple<Int64, Int64, Int64>' is not supported
    return 0
}