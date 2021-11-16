// EXEC: %compiler %cmp_opt %f -o %output | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{
    var a : Int32
    init(a:Int32){
        this.a = a
    }
}

func main(): Int64 {
    var l : A = A(1)
    var r : A = A(2)
    var temp = r
    l = temp
    if (l.a == r.a) {
        return 0
    }
    return 1
}
