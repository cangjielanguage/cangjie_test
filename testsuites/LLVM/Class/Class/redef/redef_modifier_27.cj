// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump


func main():Int64 {
    return 0
}

interface Coo {
    redef static prop var a : Int64 {  // EXPECTED: regex error.*?'redef' modifier is illegal for property declaration in interface body
        get(){ return 2 }
        set(v) {}
    }
}