// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

record B{
    var a:Int32 = 1
    let b:Int32 = 1
}

func main(): Int64 {
    A().a = 2
    A().b = 2 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    B().a = 2 // EXPECTED: regex-auto cannot change immutable value : function call returns immutable value
    B().b = 2 // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    return 0
}

class A{
    var a:Int32 = 1
    let b:Int32 = 1
}

