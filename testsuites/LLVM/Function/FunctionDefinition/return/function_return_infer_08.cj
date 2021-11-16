// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main(): Int64 {
    case01()++ // EXPECTED: regex-auto call_expr is illegal before this increment or decrement expression
    case02().a++
    case02().b++ // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    case03().a++ // EXPECTED: regex-auto cannot change immutable value : function call returns immutable value 
    case03().b++ // EXPECTED: regex-auto cannot change immutable value : function call returns immutable value

    return 0
}

func case01(){
    var a:Int32 = 1
    a
}

func case02(){
    A()
}

func case03(){
    B()
}

class A{
    var a:Int32 = 1
    let b:Int32 = 1
}

record B{
    var a:Int32 = 1
    let b:Int32 = 1
}
