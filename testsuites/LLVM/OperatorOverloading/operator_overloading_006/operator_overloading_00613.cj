// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
class A{}

interface update{
    operator func *(b:This):Int32{return 1} // EXPECTED: regex 'This' type is not allowed here
}

func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
