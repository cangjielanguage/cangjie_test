// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main(): Int64 {
    var a:A = A()
    return 0
}

class A {
    open prop var m: Int64 {
        get() {
            return 0
        }
        set(v){}
    }
    open prop let n: Int64 {
        get() {
            return 1
        }
    }
    A(){
        var b = m // EXPECTED: regex error.*?'open' modifier member 'm' cannot be accessed in constructor of class 'A'
        var c = n // EXPECTED: regex error.*?'open' modifier member 'n' cannot be accessed in constructor of class 'A'
    }
}
