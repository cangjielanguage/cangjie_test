// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = (3, 5)
    match (i) { Case (3, 5) => } // EXPECTED: regex at least one case expression in match case bod
    return 0
}
