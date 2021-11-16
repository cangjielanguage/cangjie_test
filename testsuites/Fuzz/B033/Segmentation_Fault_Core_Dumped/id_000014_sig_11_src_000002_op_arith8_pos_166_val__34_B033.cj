// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func foo<T>(x: T): T { return x }

func main():Int64{
    var arr1 = @{1,2,3[
    var res = foo<Array<Int64>>(arr1).size
    if res == 3 {
        return 0
    }
    return 1
}
