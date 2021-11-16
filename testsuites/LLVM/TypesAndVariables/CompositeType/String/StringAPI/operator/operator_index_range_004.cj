// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


// 索引操作符溢出
func main():Int64 {
    var s1 = "仓颉"[..:1]    // EXPECTED: regex the value of 'step' cannot be set without start or stop for slicing
    return 0
}
