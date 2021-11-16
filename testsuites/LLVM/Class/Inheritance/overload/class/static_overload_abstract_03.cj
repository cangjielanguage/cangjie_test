// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

abstract class Base {
    static func foo () {
        return 1
    }
}

class Data <: Base {
    
    static func foo (a : Int64) {
        return a
    }

    static func foo (a : Int64, b: Bool , c!: Bool = true) {
        if(b){
            return 1
        } else {
            return a
        }
    }

    static func inside(){
        return foo() + foo(2) + foo(0, true)
    }
}

func main(): Int64 {
    var res1 : Int64 = Data.foo()
    var res2 : Int64 = Data.foo(2)
    var res3 : Int64 = Data.foo(0, true)
    var res4 : Int64 = Data.inside()
    if ( res1 != 1 || res2 != 2 || res3 != 1 || res4 != 4) {
        return 1
    }
    return 0
}