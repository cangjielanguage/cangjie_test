// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend String {
    open prop var m: Int32 { // EXPECTED: regex error.*?'open' modifier is illegal for property declaration in extend body
        get() {
            return 2
        }
        set(v){}
    }
    override prop let isEmpty: Int32 { // EXPECTED: regex error.*?extend member 'isEmpty' is not allowed to shadow members of 'Record-String'
        get() {
            return 1
        }
    }
}
