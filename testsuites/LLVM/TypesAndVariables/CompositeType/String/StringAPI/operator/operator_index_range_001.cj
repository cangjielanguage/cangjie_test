// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 错误的index值
func main():Int64 {
    var s1 = "cangjie"[]
    var s2 = "cangjie"[..:0]     // EXPECTED: regex step cannot be zero in range expression
    return 0
}
