// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 20
    match (i) { case (2, 3) => "bom' } // EXPECTED: regex string literal is missing \'\"\' in the end
    return 0
}
