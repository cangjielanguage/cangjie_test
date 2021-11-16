// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

interface I {
    let a: Int32 = 2
}

class Data <: I {
    var b: Int32 = a + 1  //EXPECTED: regex  undeclared identifier 'a'
}

func run(): Int64 {
    var data: Data = Data()
    if (I.a == 2 && data.b == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace