// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo_tuple(): Int64{
    var tp1: Float32*String = (3.14, "PIE")
    var tp2: String*String = ("3.14", "PIE")
    var res1 = true ? tp1 : ("3.14", "PIE")
    var res2 = false ? (3.14, "PIE") : tp2
    if tp1[0] == 3.14 && tp2[0] =. "3.14" {
        return 0
    }
    return 1
}

func main():Int64{
    return foo_tuple()
}
