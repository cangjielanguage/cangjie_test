// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump


// open class -> class
class A2 {
    open prop var i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}
class B2 <: A2 {
    override prop var i: Int64 {
        get() { return 1 }
        set(v) {}
    }
}

// open prop -> prop
open class A3 {
     prop var i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}
class B3 <: A3 {
    override prop var i: Int64 {
        get() { return 1 }
        set(v) {}
    }
}

// open class -> class ; open prop -> prop
class A4 {  
    prop var i: Int64 {
        get() { return 0 }
        set(v) {}
    }
}
class B4 <: A4 {  // EXPECTED: regex error.*?super class 'A4' is not inheritable, use 'open' modifier instead
    override prop var i: Int64 {
        get() { return 1 }
        set(v) {}
    }
}

func main():Int64 {
    A2();B2();A3();B3();A4();B4();
    return 0
}
