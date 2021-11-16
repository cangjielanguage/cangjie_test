// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    match { case _ => print("20"] } // EXPECTED: regex expected \',\' to separate or \'\)\' to close
    return 0
}
