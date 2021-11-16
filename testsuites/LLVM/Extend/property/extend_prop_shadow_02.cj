// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend String {
    prop let isEmpty: Int32 {// EXPECTED: regex-auto extend member 'isEmpty' is not allowed to shadow members of 'Record-String'
        get() {
            return 1
        }
    }
}
