// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    let i = "Jack"
    match (i) { case "hello world!" => case "bom" => ] // EXPECTED: regex ']' is not allowed in block, expected expression or declaration here
    return 0
}
