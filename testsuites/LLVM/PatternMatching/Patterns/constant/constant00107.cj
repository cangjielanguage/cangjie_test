// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex undeclared identifier 'nothing'
func test(): Int64 {
    var i : Int32 = 0
    match (i) {
        case $nothing => "0"
        case _ => "default"
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
