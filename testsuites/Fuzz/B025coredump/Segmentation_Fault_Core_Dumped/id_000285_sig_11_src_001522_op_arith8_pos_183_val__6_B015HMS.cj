// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{}

func main(): Int64 {
    var a : A = A()
    [++ 
    a-- 
    return 0
}
