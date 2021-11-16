// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = false
    match (i) { case true | "false" == "true" => case false | false > true => } // EXPECTED: regex const pattern is not matched
    return 0
}
