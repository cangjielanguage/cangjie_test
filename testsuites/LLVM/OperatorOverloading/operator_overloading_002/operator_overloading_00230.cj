// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

record R{
    operator func ||(inputB:R):Int64{ // EXPECTED: regex illegal operator '||' for overloading
        return 1
    }
}

class C{
    operator func ||(inputB:C):Int64{ // EXPECTED: regex illegal operator '||' for overloading
        return 10
    }
}


interface I{
    operator func ||(inputB:I):Int64{ // EXPECTED: regex illegal operator '||' for overloading
        return 100
    }
}

class A <: I{}

func main():Int64{
    var a : I = A()
    var c = C()
    var r = R()
    return (a||a)+(c||c)+(r||r)-111
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
