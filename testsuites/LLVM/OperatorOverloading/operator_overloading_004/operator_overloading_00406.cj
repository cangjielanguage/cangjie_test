// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record A{
    let a : Int32 = 1
}

class C{
    let a : Int32 = 1
}

interface I{
    let a : Int32 = 1
}

operator func + (inputB:A):Bool{ // EXPECTED: regex 'operator' modifier is illegal for function declaration
    return true
}

operator func + (inputB:C):Bool{ // EXPECTED: regex 'operator' modifier is illegal for function declaration
    return true
}

operator func + (inputB:I):Bool{ // EXPECTED: regex 'operator' modifier is illegal for function declaration
    return true
}

class B <: I{}

func main():Int64{
    let a = A()
    let b = B()
    let c = C()
    return 1
}
