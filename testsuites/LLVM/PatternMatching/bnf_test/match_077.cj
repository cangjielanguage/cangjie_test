// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let i = ("jack", 80)
    match (i) { case ("jack", 80) if (x > 0) => } // EXPECTED: regex undeclared identifier 'x'
    return 0
}
