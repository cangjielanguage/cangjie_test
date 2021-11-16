// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "jack"
    match (i) { case "jack" => case "bom" => // EXPECTED: regex type of return expression is incompatible with expression type
    return 0
}
