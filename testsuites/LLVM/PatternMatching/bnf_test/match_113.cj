// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f

func main() {
    match case true => "case" case true || false => 20 } // EXPECTED: regex-auto missing '(' in match expression
    return 0
}
