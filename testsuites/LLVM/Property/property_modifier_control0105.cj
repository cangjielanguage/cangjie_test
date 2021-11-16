// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

record Roo {
    private prop let a: Int64 {
        get() { return 0 }
    }
}

func main():Int64 {
    if (Roo().a != 0 ){ // EXPECTED: regex error.*?can not access field 'a'
        return 1
    }
    return 0
}
