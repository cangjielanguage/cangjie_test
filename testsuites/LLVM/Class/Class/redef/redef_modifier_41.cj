// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

redef class Boo{} // EXPECTED: regex error.*? 'redef' modifier is illegal for class declaration in top level