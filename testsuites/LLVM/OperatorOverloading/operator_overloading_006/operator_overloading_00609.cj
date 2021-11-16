// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
class A{}

interface update{
    operator func *():Int32 // EXPECTED: regex-auto invalid number of parameters for operator '*'
}
extend Char <: update{
    operator func * ():Int32{return 0} // EXPECTED: regex-auto invalid number of parameters for operator '*'
}

extend A <: update{
    operator func * ():Int32{return 0} // EXPECTED: regex-auto invalid number of parameters for operator '*'
}
func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
