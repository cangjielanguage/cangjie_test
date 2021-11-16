// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex start and stop must be of the same type in range expression

open class A{
    let a : Int32
    let b : Int32
    init(){
        this.a = 1
        this.b = 10
    }
    let myRange = this()..this():this()  // EXPECTED: regex invalid calling 'this' outside the constructor
    let myRange2 = this..this:this // EXPECTED: regex 'this' is not allowed to initialize non-static member

}

func main(): Int64 {
    let a = A()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
