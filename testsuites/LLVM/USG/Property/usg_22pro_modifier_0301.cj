// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class A {
    prop var i: Int64 { //EXPECTED: regex error.*overridden property 'i' should have 'open' modifier
        get() { return 0 }
        set(v) {}
    }
}

class B <: A {
    override prop var i: Int64 {
        get() { return 1 }
        set(v) {}
    }
}

func main() {
    var res = A()
    if (  res.i != 0 ) {
        return 1
    }
    var ret = B()
    if ( ret.i != 1 ) {
        return 1
    }
    return 0
}
