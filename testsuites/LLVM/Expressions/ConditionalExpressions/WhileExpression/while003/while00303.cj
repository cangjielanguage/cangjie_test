// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {  // EXPECTED: regex note.* to match this '{'
    while (true) {
    return 1
}  // EXPECTED: regex error.* expected '}'
