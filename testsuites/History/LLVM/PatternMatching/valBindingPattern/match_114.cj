// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let scoreTuple = ("Jack", 60)
    match (i) { case score@@ (_, _) => case score\@ (_, 80) => } // EXPECTED: regex expected pattern here
    return 0
}
