// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record A{
    let a : Int32
    func + (inputB:A):Int32{ // EXPECTED: regex expected function name after 'func'
        return 0
    }
}


func main():Int64{
    var a = A(1)
    var b = A(-1)
    return (a+b)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
