// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


interface A{
    let a : Int32 = 1
    operator func +(inputB:A):Int32{
        return 0
    }
}

class B <: A{}


func main():Int64{  // EXPECTED: regex type of function body is incompatible with return type
    let a : A = B()
    return a+a // EXPECTED: regex type of return expression is incompatible with return type
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
