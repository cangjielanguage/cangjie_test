// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


class Data  {
    Data(in:Int32){ // EXPECTED: regex 'in' is keyword not identifier, you can use '`in`' instead
        print(in.toString())
    }
}
func run(): Int64 {
    var data: Data = Data(2)
    return 0
}
func main(): Int64 {
    return run()
}
