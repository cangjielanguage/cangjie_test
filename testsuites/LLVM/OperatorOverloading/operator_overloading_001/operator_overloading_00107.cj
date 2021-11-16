// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    operator func +(inputB:A):Int64{
        return 0
    }
}

interface C <: A{
    operator func +(inputB:C):Int64{
        return 0
    }

}

class B <: C{}


func main():Int64{
    let a : A = B()
    return (a+a)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
