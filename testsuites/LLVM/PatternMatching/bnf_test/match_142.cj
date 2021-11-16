// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var x = 10
    match (x) { case => } // EXPECTED: regex invalid pattern in a match case
    return 0
}
