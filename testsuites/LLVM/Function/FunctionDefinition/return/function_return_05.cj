// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation


//函数体中所有 return e 表达式中 e 的类型是标注的类型（ Type ）的子类型，否则编译报错
func main(): Int64 {
    if (case01() != 1) {
        return 1
    }
    if (case02() != 1) {
        return 2
    }
    if (case04(1,2).aoo() != 1) {
        return 4
    }
    return 0
}

func case01():Int32{
    let a  = 1
    return a // EXPECTED: regex  type of return expression is incompatible with return type
}
func case02():Int32{
    let a = 1
    return Int64(a) // EXPECTED: regex  type of return expression is incompatible with return type
}
func case04(a: Int32, b: Int32):B{
    if (a>b){
        return A() // EXPECTED: regex  type of return expression is incompatible with return type
    }else{
        return B()
    }
}

open class A {
    let a = 2
    open func aoo(){return a }
}
class B <: A {
    let b = 1
    override func aoo(){return b}

}
