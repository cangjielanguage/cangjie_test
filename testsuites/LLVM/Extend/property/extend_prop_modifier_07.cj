// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend String {
    public prop var m: Int32 // EXPECTED: regex error.*?property must have accessors
    static prop let n: Int32 // EXPECTED: regex error.*?property must have accessors
}
