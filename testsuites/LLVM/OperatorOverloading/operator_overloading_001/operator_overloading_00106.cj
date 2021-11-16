// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


interface A{
    let a : Int32 = 1
    static operator func +(inputB:A):Int32{ // EXPECTED: regex modifiers 'static' and 'operator' are conflict in function declaration
        return 0
    }
}

class B <: A{}


func main():Int64{
    let a : A = B()
    return a+a
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
