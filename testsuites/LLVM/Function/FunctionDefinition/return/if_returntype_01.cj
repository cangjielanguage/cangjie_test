// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

//对于没有 else 分支的 if 表达式，它的类型为 Unit ，它的值等于 ()

func main(): Int64 {
    if (case01(2,1) != ()) {
        return 4
    }
    if (case02(2,1) != ()) {
        return 4
    }
    return 0
}

func case01(a: Int32, b: Int32){
    if (a>b){
        A()
    }
}

func case02(a: Int32, b: Int32){
    if (a>b){
        A()
        ()
    } else {
        ()
    }
}


open class A {
    open func foo(){return 10 }
}

class B <: A {
    override func foo(){return 20}
}
