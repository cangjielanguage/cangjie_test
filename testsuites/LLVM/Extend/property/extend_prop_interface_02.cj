// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

interface I {
    prop var m: Int64
    prop let n: Int64
}

class Foo{
    prop var m: Int64 {
        get() {
            return 3
        }
        set(v){}
    }
    prop let n: Int64 {
        get() {
            return 4
        }
    }
}

extend Foo <: I {
    prop var m: Int64 { // EXPECTED: regex error.*?extend member 'm' is not allowed to shadow members of 'Class-Foo'
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int64 { // EXPECTED: regex error.*?extend member 'n' is not allowed to shadow members of 'Class-Foo'
        get() {
            return 1
        }
    }
}