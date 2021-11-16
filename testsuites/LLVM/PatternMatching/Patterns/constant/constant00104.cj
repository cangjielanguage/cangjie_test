// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'j' as 'const pattern' should be read only variable
func test(): Int64 {
    var i : Int32 = 0
    var j : Int32 = 0
    match (i) {
        case $j => "0"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
