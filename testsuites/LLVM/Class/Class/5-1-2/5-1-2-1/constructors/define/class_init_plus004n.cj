// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data  {
    init(){
        var a:Int32 = 5
    }
    var f = this() //  EXPECTED: regex invalid calling 'this' outside the constructor
}
func run(): Int64 {
    var data: Data = Data()
    return 0
}
func main(): Int64 {
    return run()
}
