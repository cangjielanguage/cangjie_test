// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    let x = 10
    match (i) { case true if ([ if (x > 5)) => } // EXPECTED: regex expected \'\]\' in the end of list literal
    return 0
}
