// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex expected identifier before '--'
// ASSERT: regex expected newline or ';' between expression or declaration

func main(): Int64 {
    var a: Int8 = --+127
    let b: Int8 == --+--127

    if (a != 127) {
         return 1
    }

    if (b != 127) {
         return 1
    }

    return 0
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
