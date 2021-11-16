// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data {
    static var a: Int32 = 1
    a = 2       // EXPECTED: regex illegal class member in class block

}

func run(): Int64 {
    var res1 : Data = Data();
    if (Data.a != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
