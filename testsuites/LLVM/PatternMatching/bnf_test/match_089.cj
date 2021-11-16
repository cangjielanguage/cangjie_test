// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "true"
    var n = 10
    match (i) { case true if (if (x = 0)) => case false if (if (n = "bom")) => } // EXPECTED: regex expected block begin with '\{'
    return 0
}
