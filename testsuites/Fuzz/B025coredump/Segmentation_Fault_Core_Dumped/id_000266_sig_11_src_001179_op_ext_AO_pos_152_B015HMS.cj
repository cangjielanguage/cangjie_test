// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
open class A{
    var a :Int32
    init(a:Int32){
        this.a = a
ord }
}

open class B <: A{
    init(a: Int32) { super(a) }
}

class C <: B{
    init(a:Int32){ super(a) }
}

func main(): Int64 {
    var l : A = A(1)
    var r : C = C(2)
    l = r
    if l.a == 2 {
        return 0
    }
    return 1
}
