// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    func foo () {
        return 1
    }
}

class Data <: Base {
    func foo (a : Int64) {
        return a
    }
}

func main(): Int64 {
    var obj1 = Base()
    var obj2 = Data()
    
    var res1 : Int64 = obj1.foo()
    var res2 : Int64 = obj2.foo(2)
    if (res1 != 1 || res2 != 2) {
        return 1
    }
    return 0
}