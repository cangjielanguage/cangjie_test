// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
     static prop var i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}
class B <: A {
    static prop var i: Int64 { // EXPECTED: regex need 'redef' modifier for property 'i'
            get() { return 0 }
        set(v) {}
    }
}


func main():Int64 {
    return 0
}
