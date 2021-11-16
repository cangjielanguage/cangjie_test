// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E<T>{
    e|e(T)|e(T,T)
    prop let x : Int64 {
        get(){0}
    }
}

class C{var x : Int64 = 1}

var e = C()

func main(): Int64 {
    return e.x // EXPECTED: regex enum sugar access 'e' conflict with variable name, try to use with prefix
}
