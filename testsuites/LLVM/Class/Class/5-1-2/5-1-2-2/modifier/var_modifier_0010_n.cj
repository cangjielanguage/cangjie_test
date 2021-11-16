// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f
// ASSERT: regex can not access field 'a'


class Data {
    protected var a : Int32 = 1
}

func run(): Int64 {
    var value : Data = Data()
    if (value.a != 1) {
        return 1
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
