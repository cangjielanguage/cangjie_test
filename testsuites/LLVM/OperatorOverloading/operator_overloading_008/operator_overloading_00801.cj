// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
class A{}

func main():Int64{
    var a = A()
    a+a // EXPECTED:regex error.*?invalid binary operator \'\+\' on type \'Class-A\' and \'Class-A\'
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
