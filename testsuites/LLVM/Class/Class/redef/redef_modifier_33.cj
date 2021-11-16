// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

record Aoo {
    redef func foo() { // EXPECTED: regex error.*?'redef' modifier is illegal for function declaration in record body
        return 2
    }
}