// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A{}

interface update{
    operator func ! ():This 
}

extend A <: update{
    operator func ! ():A{return A()}
}

extend Int32 <: update{
    operator func !():Int32{return 1} // EXPECTED: regex-auto operator func !() of type Int32 is a built-in function and cannot be overridden
}


func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
