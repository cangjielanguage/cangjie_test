// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A{
    class B{ // EXPECTED: regex class type must be toplevel
        operator func +(b:B):Bool{return true}
    }
    static func test(){
        var b = A.B()
        if (b+b) {
            return 0
        }
        return 1
    }
}


func main():Int64{
    return A.test()
}
