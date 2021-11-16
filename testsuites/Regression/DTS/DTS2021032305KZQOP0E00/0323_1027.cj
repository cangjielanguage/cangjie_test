// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation


record A{
    var a:Int32 = 1
    let b:Int32 = 1
}

func main(): Int64 {

    var x = A()
    x.a = 2
    x.b = 2 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant

    let y = A()
    y.a = 2  // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    y.b = 2 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant

    var m = B()
    m.a = 2
    m.b = 2 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant

    let n = B()
    n.a = 2  // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    n.b = 2 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant

    return 0
}

record B{
    var a:Int32 = 1
    let b:Int32 = 1
}
