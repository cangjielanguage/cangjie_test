// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a : Foo = Foo()
    if( a.n != 1) {
        return 1
    }
    a.m = 10
    if( a.m != 2) {
        return 2
    }
    return 0
}

interface I {
    prop var m: Int64 {
        get() {
            return 3
        }
        set(v){}
    }
    prop let n: Int64 {
        get() {
            return 4
        }
    }
}

class Foo{}

extend Foo <: I {
    prop var m: Int64 {
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int64 {
        get() {
            return 1
        }
    }
}