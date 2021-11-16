// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record A{
    operator func - (inputB:A):Int32{
        return 1
    }
    let a = - // EXPECTED: regex expected expression here
}

class C{
    operator func - (inputB:C):Int32{
        return 1
    }
    let a = - // EXPECTED: regex expected expression here
}

interface I{
    operator func - (inputB:I):Int32{
        return 1
    }
    let a = - // EXPECTED: regex expected expression here
}

class B <: I{}

func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
