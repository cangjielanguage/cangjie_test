// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if (case01(1,2).foo() != 20) {
        return 4
    }
    if (case01(2,1).foo() != 10) {
        return 4
    }
    return 0
}

func case01(a: Int32, b: Int32):A{
    if (a>b){
        return A()
    }else{
        return B()
    }
}

func case02(a: Int32, b: Int32){
    if (a>b){
        A()
    }
}

open class A {
    open func foo(){return 10 }
}

class B <: A {
    override func foo(){return 20}
}
