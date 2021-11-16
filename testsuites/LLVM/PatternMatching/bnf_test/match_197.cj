// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var x = "jack"
    match ([ case 2 > 3 => print($) {x}) case 3 > 2 => print("bom") } // EXPECTED: regex expected \'\]\' in the end of list literal
    return 0
}
