// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

//对于没有 else 分支的 if 表达式，它的类型为 Unit ，它的值等于 ()

func main(): Int64 {
    if (case01(2,1) != ()) {
        return 4
    }
    return 0
}

func case01(a: Int32, b: Int32){
    if (a>b){ // EXPECTED: regex error.*?type of return expression is incompatible with expression type
        return A()
    }
}

func case02(a: Int32, b: Int32): A{ // EXPECTED: regex error.*?type of function body is incompatible with return type
    if (a>b){
        return A()
    }
}

open class A {
    open func foo(){return 10 }
}

class B <: A {
    override func foo(){return 20}
}
