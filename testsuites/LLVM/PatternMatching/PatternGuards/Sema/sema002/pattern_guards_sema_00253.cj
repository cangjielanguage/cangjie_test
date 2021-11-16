// EXEC: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex error
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main():Int64{
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (return 0) => i // EXPECTED: regex expression of Nothing type cannot appear here currently
        case _ => i + 1
    }
    return y-1
}
