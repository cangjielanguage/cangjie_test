// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 20
    let n = [10, 20, 30]
    match (i) { case In $n => case !!in [40, 50] => } // EXPECTED: regex expected '=>' after pattern in case body
    return 0
}
