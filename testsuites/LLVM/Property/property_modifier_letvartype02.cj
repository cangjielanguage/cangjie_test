// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class P {}
class S {}
class A {
    open prop let i1: P {
        get() { return P() }
    }
    static prop let i2: P {
        get() { return P() }
    }
}
class B <: A {
    override prop var i1: P { // EXPECTED: regex error.*?property 'i1' should be 'let'
        get() {return P()}
    }
    /*
    redef static prop var i2: P {
        get() {return P()} 
    }
    */
}
class C <: A {
    override prop let i1: S { // EXPECTED: regex The return type of the override/implement property must be the same
        get() { return S() }
    }
}

func main():Int64 {
    A();B();C()
    return 0
}
