// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

func bar() {2 // EXPECTED: regex note.*to match this '{'

func main():Int64 {
    bar()
    return 0
}  // EXPECTED: regex error.*expected '}'
