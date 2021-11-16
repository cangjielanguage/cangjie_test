// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{
    let a : Int32 = 1
    let b : Int32 = this.a + 9
    let myRange = this.a..this.b:this.a
}

class B <: A{
    let myRange = super.a..super.b:super.a // EXPECTED: regex not allowed to initialize non-static member
}


func main(): Int64 {
    let b = B()
    return 0
}
