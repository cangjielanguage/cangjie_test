// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Int32 {
let myList: Array<Int32> = @{0,1,2[
for i in myList if
true
{
return 0
i = i + 1
}
return 1
}

func main(): Int64 {
return test()
}
