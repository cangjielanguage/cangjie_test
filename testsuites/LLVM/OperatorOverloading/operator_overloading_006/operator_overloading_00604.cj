// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A{}

interface update{
    operator func ! (b:This,c:This):This // EXPECTED: regex invalid number of parameters for operator '!'
}

extend Int32 <: update{
    operator func ! (b:Int32,c:Int32):Int32{return 1} // EXPECTED: regex invalid number of parameters for operator '!'
}

extend A <: update{
    operator func ! (b:A,c:A):A{return A()} // EXPECTED: regex invalid number of parameters for operator '!'
}

func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
