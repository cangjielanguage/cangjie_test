// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface C {}

interface D <: C{}


class A  <: C {
    var a : Int32
    init(a:Int32){
        this.a = a
    }
}


class B <: D {
    var b : Int32
    init(b:Int32){
        this.b = b
    }
}

func main(): Int64 {
    var l : D = B(1)
    var r : A = A(2)
    l = r // EXPECTED: regex type incompatible in this assignment
    if (l.a == 2) {
        return 0
    }
    return 1
}
