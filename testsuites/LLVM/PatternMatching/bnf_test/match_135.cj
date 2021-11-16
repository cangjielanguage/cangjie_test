// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "bom"
    match { case _ "jack" case _ print("bom") } // EXPECTED: regex expected \'=>\' after pattern in case body
    return 0
}
