// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = 'true'
    let N = 10
    let M = 'jack'
    match (i) { case true if ( if ($N > 5) => case false if ( if ($M == 'bom') => } // EXPECTED: regex too many characters between ''
    return 0
}
