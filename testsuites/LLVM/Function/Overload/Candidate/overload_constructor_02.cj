// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

// 同名同参数数量同参数类型，不可重载
enum TimeUnit1 {
    foo(Int32) | foo(Int32) // EXPECTED: regex 'foo' is already exist in enum 'TimeUnit1'
}

// 同名同参数数量不同参数类型，不可重载
enum TimeUnit2 {
    foo(Int32) | foo(Int64) // EXPECTED: regex 'foo' is already exist in enum 'TimeUnit2'
}
