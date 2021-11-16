// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Father {
    static func foo(a:Int8): Int64 { return 1 }
}

class Child <: Father {
    protected func foo(a:Int16): Int64 { return 2 }
}

func main() {
    var i = Child()
    if (i.foo(Int16(1)) != Int64(2)) { // EXPECTED: regex no matching function declaration for function call
        return 1
    }
    return 0
}
