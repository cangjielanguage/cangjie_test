// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = false
    let x = "bom"
    match (i) { case "$" x => } // EXPECTED: regex const pattern is not matched
    return 0
}
