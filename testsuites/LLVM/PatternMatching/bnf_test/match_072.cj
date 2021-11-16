// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 90
    let PASS = 60
    match (i) { case true | $$PASS | $*PASS => } // EXPECTED: regex expected constant literal here
    return 0
}
