// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "true"
    var x = 10
    match (i) { case true iif (if (x > 5)) => case false If (if (x < 5)) => } // EXPECTED: regex const pattern is not matched
    return 0
}
