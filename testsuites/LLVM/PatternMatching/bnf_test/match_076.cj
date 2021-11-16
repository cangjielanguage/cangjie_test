// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let i = 50
    match (i) { case n @ "jack" case m @ "\" => } // EXPECTED: regex string literal is missing '\"' in the end
    return 0
}
