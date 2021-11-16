// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var c : Int64 = 1
    let a : Array<Int64> = @{1,0}
    c = a[{  => }] // EXPECTED: regex the index must be of type Int64
    return c
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
