// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main():Int64{
    let s1 = ""  // empty string
    let s2: String = "Hello Cangjie Lang"  // define string s2
    var s3 = "\"Hello Cangjie Lang\""  // define string s3 containing character "
    var s4: String = "Hello Cangjie Lang\n"  // define string s4 containing
    let s5 = "hello\" // EXPECTED: regex string literal is missing '\"' in the end
    let s6 = "Hello "Cangjie Lang" // EXPECTED: regex string literal is missing '\"' in the end
    return 0 
}
