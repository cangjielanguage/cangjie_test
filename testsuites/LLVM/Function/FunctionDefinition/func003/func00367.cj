// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex 'mytype' is not a type
type mytype = Int64
func test(mytype : mytype): mytype {
    return mytype
}

func main(): Int64 {
    var a : mytype = 1
    return test(a)
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
