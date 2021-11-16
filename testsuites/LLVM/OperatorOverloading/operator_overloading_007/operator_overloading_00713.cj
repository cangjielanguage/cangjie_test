// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A{
    interface B{ // EXPECTED: regex interface type must be toplevel
        operator func +(b:B):Bool{return true}
    }
    class C <: B{} // EXPECTED: regex class type must be toplevel
    static func test(){
        var b : A.B = A.C()
        if (b+b) {
            return 0
        }
        return 1
    }
}


func main():Int64{
    return A.test()
}
