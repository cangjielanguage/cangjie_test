// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record R{
    operator func !(b:R):Int32{ // EXPECTED: regex-auto invalid number of parameters for operator '!'
        return 1
    }
    operator func !(b:R):Int32{ // EXPECTED: regex-auto invalid number of parameters for operator '!'
        return 1
    }
}

class C{
    operator func !(b:R):Int32{ // EXPECTED: regex-auto invalid number of parameters for operator '!'
        return 1
    }
    operator func !(b:R):Int32{ // EXPECTED: regex-auto invalid number of parameters for operator '!'
        return 1
    }
}


interface I{
    operator func !(b:R):Int32{ // EXPECTED: regex-auto invalid number of parameters for operator '!'
        return 1
    }
    operator func !(b:R):Int32{ // EXPECTED: regex-auto invalid number of parameters for operator '!'
        return 1
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
