// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
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

class Coo <: Boo {
    redef static prop var a : Int64 {  // EXPECTED: regex invalid 'redef' modifier when implementing an abstract property
        get(){ return 2 }
        set(v) {}
    }
}
