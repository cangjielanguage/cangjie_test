// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Coo {
    prop var a: Int64 {
        get() {
            return b * 2
        }
        set(v){ b = v + 1 }
    }
    var b :Int64
    init(){
        b = a // EXPECTED: regex 'a' is not allowed to be accessed before all member variables are initialized
    }
}
func main():Int64 {
    // Coo().b -> b=a -> get() -> return b*2
    Coo().b
    return 0
}
