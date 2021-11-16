// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Base {
    static func foo () {
        return 1
    }
}

class Data <: Base {
    redef static func foo () {
        return 2
    }

    static func foo (a : Int64) {
        return a
    }

    static func inside(){
        return foo() + foo(2)
    }
}

func main(): Int64 {
    var res1 : Int64 = Data.foo()
    var res2 : Int64 = Data.foo(2)
    var res3 : Int64 = Data.inside()
    if ( res1 != 2 || res2 != 2 || res3 != 4) {
        return 1
    }
    return 0
}