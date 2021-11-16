// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Data {
    var a : Int32
    protected init() {
        a = 2
    }
}

func main() : Int64{
    var a = Data() // EXPECTED: regex no matching constructor for call
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
