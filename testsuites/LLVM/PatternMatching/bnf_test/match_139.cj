// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "bom"
    let N = PASS
    match (i) { case $  N => case $$N => } // EXPECTED: regex expected pattern here
    return 0
}
