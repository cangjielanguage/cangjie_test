// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var a : String = "a"
    let myArray : Array<String> = @{a,"b"}
    var  b  = myArray.size
    var  c  = @{a,"b"[.size
    print(b.toString())
    print(c.toString())
    return 0
}
