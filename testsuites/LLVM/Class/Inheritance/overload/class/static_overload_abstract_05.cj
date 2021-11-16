// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

abstract class Base {
    func foo ():Int64
}

class Data <: Base {
    func foo () {
        return 1
    }
    func foo (a : Int64) {
        return a
    }

    func inside(){
        return foo() + foo(2)
    }
}

func main(): Int64 {
    var res1 : Int64 = Data().foo()
    var res2 : Int64 = Data().foo(2)
    var res3 : Int64 = Data().inside()
    if ( res1 != 1 || res2 != 2 || res3 != 3) {
        return 1
    }
    return 0
}