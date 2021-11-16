// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 入参为非法字符串/ 或如参为空
func main():Int64 {
    var s2 = "".contains()   // EXPECTED: regex no matching function declaration for function call 'contains'
    var s1 = "".contains("\")   // EXPECTED: regex string literal is missing '\"' in the end

    return 0
}
