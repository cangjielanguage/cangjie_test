// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

// var-get-set
open class A {
    open prop var i: Int64 {
        get() { return 0 }
        set(v){}
    }
}
class B <: A {
    override prop var i: Int64 {
        get() { return 1 }
        set(v){}
    }
}

class B5 <: A {
    override prop var i: Int64 {  // EXPECTED: regex error.*?property must have accessors
    }
}

func main():Int64 {
    A()
    B()
    return 0
}
