// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// listExpr中元素的类型要求是Type的子类型  int < float
func main(): Int64 {
    var a:List<Int32> = [3.1,4.2]
    var b:List<Float64> = [1.4, 2.5, *a, 5, 6]  // EXPECTED: regex inconsistent element type for List literal
    if (b.size() == 6) {
        return 0
    }
    return 1
}
