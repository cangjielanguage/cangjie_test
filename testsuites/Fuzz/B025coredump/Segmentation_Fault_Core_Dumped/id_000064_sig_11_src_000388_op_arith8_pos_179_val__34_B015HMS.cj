// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I{}

class A <: I {}

class B {}

func main(): Int64 {
    let myArray = @{A(),B()[
    return 0
}
