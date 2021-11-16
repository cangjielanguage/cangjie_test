// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = (0,3)
    match (i) { casse (0,2) => casse (0,3) => } // EXPECTED: regex at least one case expression in match case body
    return 0
}
