// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Foo {
    redef static prop var a : Int64 { // EXPECTED: regex error.*?'redef' modifier is illegal for property declaration in record body
        get(){ return 2 }
        set(v) {}
    }
}