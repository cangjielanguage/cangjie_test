// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record A{
    let a : Int32
    operator func + (inputB:A):A{
        var output = A(this.a + inputB.a)
        return 1 // EXPECTED: regex type of return expression is incompatible with return type
    }
}

class C{
    let a : Int32
    operator func + (inputB:C):C{
        return 1 // EXPECTED: regex type of return expression is incompatible with return type
    }
}

interface I{
    let a : Int32 = 1
    operator func + (inputB:I):I{
        return 1 // EXPECTED: regex type of return expression is incompatible with return type
    }
}

class B <: I{}

func main():Int64{
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
