// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal object in toplevel, toplevel must consist of declaration or definition
func test(): Int64 {
    var i : Int32 = 1
    match (i) {
        case _ => class MyClass{}
    }
    return 0
}

func main(): Int64 {
    return test()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
