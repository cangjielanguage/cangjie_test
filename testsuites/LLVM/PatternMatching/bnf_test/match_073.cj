// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    match { case => "good" case => 20 } // EXPECTED: regex type incompatible in this MatchCase
    return 0
}
