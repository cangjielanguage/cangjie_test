// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var x = true
    match { case true |& false => "bom" case false||| true => print($) {x}) } // EXPECTED: regex expected expression here
    return 0
}
