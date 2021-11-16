// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = ("jack", 2)
    match (i) { (2, "jack") => } // EXPECTED: regex at least one default case, such as wildcard pattern, variable pattern or \'\[\.\.\.\]\' for sequence pattern in match case.
    return 0
}
