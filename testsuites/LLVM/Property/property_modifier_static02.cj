// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
     prop var i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}
class B <: A {
    redef static prop var i: Int64 { // EXPECTED: regex error.*?static member 'i' cannot have the same name with non-static member in parent class or interfaces
        get() { return 1 }
        set(v) {}
    }
}


func main():Int64 {
    if ( A.i != 0) {
        return 1
    }
    if ( B.i != 1) {
        return 1
    }
    return 0
}
