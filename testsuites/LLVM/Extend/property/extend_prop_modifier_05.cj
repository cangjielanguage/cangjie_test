// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend String {
    static redef prop var join: Int32 { // EXPECTED: regex error.*?'redef' modifier is illegal for property declaration in extend body
        get() {
            return 2
        }
        set(v){}
    }
}
