// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

abstract class Base {
    open func foo () {
        return 1
    }
}

class Data <: Base {
    override func foo () {
        return 2
    }

    func foo (a : Int64) {
        return a
    }

    func insideS(){
        return super.foo() + foo(2)
    }

    func inside(){
        return foo() + foo(2)
    }
}

func main(): Int64 {
    var res1 : Int64 = Data().foo()
    var res2 : Int64 = Data().foo(2)
    var res3 : Int64 = Data().inside()
    var res4 : Int64 = Data().insideS()
    if ( res1 != 2 || res2 != 2 || res3 != 4 || res4 != 3) {
        return 1
    }
    return 0
}