// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main() : Int64 {
    var a:?Int64 = Some(1)
    return 0
}

extend ?Int64 { 
    prop var m: Int64 {
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int64 {
        get() {
            return 1
        }
    re dump

func main() : Int64 {
    var a:?Int64 = Some(1)
    return 0
}

extend ?Int64 { 
    prop var m: Int64 {
        get() {
            return 2
        }
        set(v){}
    }
    prop let n: Int64 {
        get() {
            return 1
        }
    }
