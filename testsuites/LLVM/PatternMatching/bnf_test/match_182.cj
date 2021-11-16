// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = false
    let n = "bom"
    let M = 20
    match (i) { case _$ n => case $/$ M => } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
