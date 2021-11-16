// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Roo {
    protected prop var b: Int64 { // EXPECTED: regex 'protected' modifier is illegal for property declaration in record body
        get() {
            return 0
        }
        set(v){}
    }
}

func main():Int64 {
    return 0
}
