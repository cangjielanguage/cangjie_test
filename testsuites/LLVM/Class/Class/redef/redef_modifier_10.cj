// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump


func main():Int64 {
    return 0
}

open class Boo {
    open prop var a : Int64 {
        get(){ return 1 }
        set(v) {}
    }
}

class Coo <: Boo {
    redef prop var a : Int64 { //EXPECTED: regex expected 'static' after 'redef'
        get(){ return 2 }
        set(v) {}
    }
}