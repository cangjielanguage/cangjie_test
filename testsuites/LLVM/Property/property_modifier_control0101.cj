// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

interface Ioo {
    public prop var a: Int64 { // EXPECTED: regex 'public' modifier is illegal for property declaration in interface body
        get() {
            return 0
        }
        set(v){}
    }
    protected prop var b: Int64 { // EXPECTED: regex 'protected' modifier is illegal for property declaration in interface body
        get() {
            return 0
        }
        set(v){}
    }
    private prop var c: Int64 { // EXPECTED: regex 'private' modifier is illegal for property declaration in interface body
        get() {
            return 0
        }
        set(v){}
    }
}

func main():Int64 {
    return 0
}
