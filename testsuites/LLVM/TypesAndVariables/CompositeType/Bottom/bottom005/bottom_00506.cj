// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test() : Bool {
    var a : Int64 = return true // EXPECTED: regex expression of Nothing type cannot appear here currently
    return false
}

func main(): Int64 {
    if (test()) {
        return 0
    } else {
        return 1
    }
}
