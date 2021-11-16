// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main() {
    match { case true | false => "false" case true | false => "true" // EXPECTED: regex invalid binary operator '|' on type 'Bool' and 'Bool'
    return 0
} // EXPECTED: regex expected '}'
