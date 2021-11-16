// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test() : Int64 {
    var i =  return 1 + return 2 // EXPECTED: regex expression of Nothing type cannot appear here currently
    return i
}

func main(): Int64 {
    return test() - 2
}
