// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend String {
    static prop var join: Int32 { // EXPECTED: regex-auto extend member 'join' is not allowed to shadow members of 'Record-String'
        get() {
            return 2
        }
        set(v){}
    }
}