// EXEC-PIPE-1: %compiler %cmp_opt %n.cj 2>&1 | compare %f

func main() {
    var x = "jack"
    match { Case _ => "bom" } // EXPECTED: regex-auto missing '(' in match expression
    return 0
}
