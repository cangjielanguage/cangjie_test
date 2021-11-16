// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f


class Data {
    let a : Int32 = 1
}

func run(): Unit {
    var value : Data = Data()
    value which is an initialized 'let' constant
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
