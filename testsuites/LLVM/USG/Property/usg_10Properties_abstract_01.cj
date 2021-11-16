// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    prop let a: Int64
    prop var b: Int64
}

class C <: I {
    private var value = 0
    prop let a: Int64 {
        get() { value }
    }
    prop var b: Int64 {
        get() { value }
        set(v) {
            value = v
        }
    }
}

func main() {
    var x = C()
    let y = x.b + 1 
    x.b = y
    let z = x.a 
    return z-x.b
}
