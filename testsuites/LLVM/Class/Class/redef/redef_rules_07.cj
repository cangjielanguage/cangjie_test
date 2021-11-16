// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    if ( Boo.foo(1) != 3 ) {
        return 1
    }
    return 0
}

open class Aoo {
    static func foo(x : Int64){
        return Base().a
    }
}

class Boo <: Aoo {
    redef static func foo(x : Int64) {
        return Data().b
    }
}

open class Base {
    var a = 1
}

class Data <: Base {
    var b = 3
}