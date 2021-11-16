// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = true
    var x = "bom"
    match (i) { case true if ([ if (x == "bom")) => case false if) { if (x != "bom")) => } // EXPECTED: regex expected expression after \'if\'
    return 0
}
