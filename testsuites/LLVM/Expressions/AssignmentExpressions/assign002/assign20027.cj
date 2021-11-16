// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
open class A{
    var a :Int32
    init(a:Int32){
        this.a = a
    }
}

class B <: A{
    init(a:Int32){
        super.a = a
    }
}

func main(): Int64 {
    var l : B = B(1)
    var r : A = A(2)
    l = r // EXPECTED: regex type incompatible in this assignment
    if (l.a == 2) {
        return 0
    }
    return 1
}
