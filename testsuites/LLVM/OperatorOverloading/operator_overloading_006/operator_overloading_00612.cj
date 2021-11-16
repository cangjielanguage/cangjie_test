// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
class A{}

interface update{
    func *(b:This,c:This):Int32 // EXPECTED: regex expected function name after 'func'
}

func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
