// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    var x = 10
    match (i) { case true (if (x > 0)) => case false if (x > 20) => } // EXPECTED: regex expected \'=>\' after pattern in case body
    return 0
}
