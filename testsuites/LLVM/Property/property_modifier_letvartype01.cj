// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

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
    override prop let i1: P {
        get() { return P()}
    }
}

func main():Int64 {
    A();B();
    return 0
}
