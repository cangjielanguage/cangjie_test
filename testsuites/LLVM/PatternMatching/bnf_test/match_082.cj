// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 3.14
    match (i) { case 31.4ee-1 => case *6.28 => } // EXPECTED: regex exponent part donot has digits
    return 0
}
