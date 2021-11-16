// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Foo {
    prop var a: Int64 {
        get() { // () -> Int64
            return "123"  // EXPECTED: regex error.*?type of return expression is incompatible with return type
        }
        set(v) { // (Int64) -> Unit
            return 123  // EXPECTED: regex error.*?type of return expression is incompatible with return type
        }
    }
    prop var b: Int64 {
        get() {
            123 // ok, return 123
        }
        set(v) {
            return () // ok, return unit
        }
    }
}

func main() {
    return 0
}
