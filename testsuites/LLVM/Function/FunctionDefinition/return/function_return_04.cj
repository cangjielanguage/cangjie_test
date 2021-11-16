// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if (case01() != 1) {
        return 1
    }
    if (case02() != 1) {
        return 2
    }
    if (case03() != 1) {
        return 3
    }
    if (case04(1,2).aoo() != 1) {
        return 4
    }
    return 0
}

func case01():Int32{
    return 1
}
func case02():Int32{
    let a = 1
    return Int32(a)
}
func case03():Int32{
    let a = 1
    return Int32(a)
}
func case04(a: Int32, b: Int32):A{
    if (a>b){
        return A()
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
