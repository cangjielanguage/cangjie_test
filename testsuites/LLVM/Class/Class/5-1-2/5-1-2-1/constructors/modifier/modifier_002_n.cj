// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

class Data {
    var a : Int32
    private init() {
        a = 2
    }
}

func main() {
    var a = Data() // EXPECTED: regex no matching constructor for call

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
