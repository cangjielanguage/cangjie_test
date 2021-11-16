// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var a : Int32 = 1
    var b : Float32
}

func run(): Int64 {
    var value : Data = Data(); / EXPECTED: regex xxxxxx
    return 1
}

func main(): Int64 {
    return run()
}
