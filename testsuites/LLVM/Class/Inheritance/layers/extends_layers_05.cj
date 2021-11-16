// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base3 {
    func foo() : Int32 {
        return 3
    }
}

open class Base2 <: Base3 {
    func foo(a : Int32) : Int32 {
        return a
    }
}

class Data <: Base2 {
     func foo(a : Int32,b: Int32) : Int32 {
        return a+b
    }
}

func main(): Int64 {
    var obj = Data()
    var res : Int32 = obj.foo(1,2)
    if (res != 3) {
        return 1
    }
    return 0
}