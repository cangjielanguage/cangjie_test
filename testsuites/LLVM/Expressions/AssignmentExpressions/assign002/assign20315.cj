// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class A{
    var a :Int32
    init(a:Int32){
        this.a = a
    }
    func test(){
        this = 1 // EXPECTED: regex cannot assign a value to 'this'
        this() = 1 // EXPECTED: regex illegal left value
    }
}

func main(): Int64 {
    return 0
}
