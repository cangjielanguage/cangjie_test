// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 5
    match (i) { case 5n => } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
