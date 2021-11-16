// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record R{
    var r : Int32
}

class C{
    var a : Int32
    operator func test (inputA:A,inputB:A):A{ // EXPECTED: regex illegal operator 'test' for overloading
        var output = A(inputA.a + inputB.a)
        return output
    }
}

interface I{
    let a : Int32 = 1
    operator func test (inputA:A,inputB:A):A{ // EXPECTED: regex illegal operator 'test' for overloading
        var output = A(inputA.a + inputB.a)
        return output
    }
}

class T {

}

interface update{
    operator func test(a:This):This // EXPECTED: regex illegal operator 'test' for overloading
}


func main():Int64{
    return 1
}
