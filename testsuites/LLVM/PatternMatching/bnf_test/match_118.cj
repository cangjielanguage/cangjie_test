// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


func main() {
    var i = "Jack"
    i { case true | \'jack' | *bom' => case false | ''world"" | "hello' => } // EXPECTED: regex too many characters between ''
    return 0
}
