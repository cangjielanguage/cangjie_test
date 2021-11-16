// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{
    operator func +(b:B):Int32{return 1}
}

interface B{
    operator func +(b:B):Int32{return 2}
}

class C <: A{}

class D <: B{}

func main():Int64{
    var a : A = C()
    var b : B = D()
    a+b // EXPECTED: regex-auto ambiguous match for + overload function call
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
