// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{
    e(T)|e(T,T)
    prop let x : Int64 {
        get(){1}
    }
}

class C{var x : Int64 = 0}

var e = C()

func main(): Int64 {
    return e.x
}
