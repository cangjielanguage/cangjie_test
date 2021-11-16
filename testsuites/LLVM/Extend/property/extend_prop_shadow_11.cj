// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a = Coo()
    if( a.n != 1) {
        return 1
    }
    a.m = 10
    if( a.m != 2) {
        return 2
    }
    return 0
}

abstract class Boo{
    prop var m: Int32
    prop let n: Int32
}

extend Boo {
    prop var m: Int32 { // EXPECTED: regex-auto extend member 'm' is not allowed to shadow members of 'Class-Boo'
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int32 { // EXPECTED: regex-auto extend member 'n' is not allowed to shadow members of 'Class-Boo'
        get() {
            return 1
        }
    }
}

class Coo <: Boo{
    prop var m: Int32 {
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int32 {
        get() {
            return 1
        }
    }
}