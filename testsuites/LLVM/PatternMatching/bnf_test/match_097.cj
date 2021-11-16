// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 'true'
    let N = 10
    match (i) { case true (if ($N > 5)) => } // EXPECTED: regex-auto expected '=>' after pattern in case body
    return 0
}
