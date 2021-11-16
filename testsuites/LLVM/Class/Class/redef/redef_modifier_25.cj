// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump


func main():Int64 {
    return 0
}

interface Boo {
    static prop var a : Int64 {
        get(){ return 1 }
        set(v) {}
    }
}

interface Coo <: Boo {
    redef static prop var a : Int64 {  // EXPECTED: regex error.*?'redef' modifier is illegal for property declaration in interface body
        get(){ return 2 }
        set(v) {}
    }
}