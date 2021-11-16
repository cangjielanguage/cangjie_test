// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex integer type is expected for start, stop and step in range expression
func test():Unit{
    return
}


func main(): Int64 {
    let a = ()..():()
    let b = test()..test():test()
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
