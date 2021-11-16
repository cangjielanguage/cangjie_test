// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    var b = foo(1,'a')
    return 0
}

enum TimeUnit {
    foo | foo(Int32) | foo(Int64,String)  | foo(Int32,String) // EXPECTED: regex error.*?'foo' is already exist in enum 'TimeUnit'
}
