// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    operator func +(b:B):Int32{return 1}
}

class B{
    operator func +(b:B):Int32{return 2}
}

func main():Int64{
    var a = A()
    var b = B()
    a+b // EXPECTED: regex-auto ambiguous match for + overload function call
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
