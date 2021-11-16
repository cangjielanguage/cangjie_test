// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    init(){
        this(a) // EXPECTED: regex undeclared identifier 'a'
        var a:Int32 = 5
    }
    init(input:Int32){
        print(input.toString()+"\n")
    }
}
func run(): Int64 {
    var data: Data = Data()
    return 0
}
func main(): Int64 {
    return run()
}

