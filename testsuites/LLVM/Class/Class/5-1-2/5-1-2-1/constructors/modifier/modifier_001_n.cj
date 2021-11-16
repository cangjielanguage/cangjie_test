// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


class Data {
    var a : Int32
    public init() {
        a = 2
    }
}

func main() {
    var a = Data()
    if (a.a != 2) {
        return 1
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
