// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let i = ("Jack", 60)
    let PASS = ("bom", 60)
    match (i) { case true | '$'PASS => } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
