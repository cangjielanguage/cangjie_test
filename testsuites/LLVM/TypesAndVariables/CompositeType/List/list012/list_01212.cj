// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 字面量解析listExpr
func main(): Int64 {
    var a = [1, 2, *[]]     // EXPECTED: regex empty list literal type cannot be inferred
    var b = [1, 2, *[2,3]]
    var c = [1, 2, *[1,2],*[4,5]]
    var d = [1, 2, *[1,2,*[4,5]]]
    return 0
}
