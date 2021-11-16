// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    match { casse _ => "true" casse _ => "false" } // EXPECTED: regex-auto missing '(' in match expression
    return 0
}
