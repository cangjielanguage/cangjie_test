// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex type of return expression is incompatible with return type
func test() : Bool {
    var a : Int32
    return a
}

func main() : Int64 {
    if (test() == 0) {
        return 0
    }
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
