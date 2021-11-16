// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var x = 10
    matcch { case true || false => "bom" case false && true => x = 20 } // EXPECTED: regex undeclared identifier 'matcch'
    return 0
}
