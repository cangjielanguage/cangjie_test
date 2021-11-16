// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

class Coo {
    redef static prop var a : Int64 { //EXPECTED: regex error.*?redefine property 'a' does not have an redefined 'static' property
        get(){ return 2 }
        set(v) {}
    }
}