// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Foo {
    public prop var a: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
    prop var b: Int64 {
        public get() { // EXPECTED: regex error.*modifier is not allowed here
            return 0
        }
        public set(v) {} // EXPECTED: regex error.*modifier is not allowed here
    }
}
