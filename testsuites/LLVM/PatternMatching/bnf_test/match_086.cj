// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = (5, 10)
    let n = "PASS"
    let m = "FA"
    match (i) { case true | $* n | \$ m => case false | $$ m | '$' n => } // EXPECTED: regex expected constant literal here
    return 0
}
