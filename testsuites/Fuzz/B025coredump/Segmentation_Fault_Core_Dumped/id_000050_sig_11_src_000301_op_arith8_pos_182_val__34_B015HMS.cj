// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A {}

func main(): Int64 {
    let a = A()
    let b = A()
    let myArray : Array<Array<A>> = @{@{a,b,A()}[
    return 0
}
