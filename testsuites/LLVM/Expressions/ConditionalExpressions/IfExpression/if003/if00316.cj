// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{
    var a : Int32 = 0
}

class Point <: A{
    var x: Int32 = 0
    var y: Int32 = 0
    func test(){
        if (true) {
            super.a = 1
            super() // EXPECTED: regex invalid calling 'super' outside the constructor
        }
    }
}

func main(): Int64 {
    return 0
}
