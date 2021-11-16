// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

class Foo {
    prop var a: Int64 {
        get() {
            return "123" // EXPECTED: regex error.*type of return expression is incompatible with return type
        }
        set(v) {
            return 123 // EXPECTED: regex error.*type of return expression is incompatible with return type
        }
    }
    prop var b: Int64 {
        get() {
            123
        }
        set(v) {
            return ()
        }
    }
}

func main() {
    var ret = Foo()
    return 0
}
