// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Day{
    var d: Int32
    init(x: Int32){
        d = x
    }
}
class Monday {
    var d: Int32
    init(x: Int32){
        d = x+1
    }
}
class Tuesday {
    var d: Int32
    init(x: Int32){
        d = x+2
    }
}

trait Num<V1,V2,V3> where V1<:Day,V2<:Monday,V3<:Tuesday {
    func chooseOne(a: This, b: V1,c:V2,d:V3): V1
}

record Student {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student with Num<U1,U2,U3> where U1<:Day ,U2<:Monday ,U3<:Tuesday{
    func chooseOne(a: Student, b:U1, c:U2, d:U3): U1 { return b}
}


func run(): Int64 {
    var v1: Student = Student(1)
    var v2: Monday = Monday(2)
    var v3: Tuesday = Tuesday(3)
    var v4: Day = Day(4)
    let x: Monday = chooseOne(v1,v2,v3,v4)
    if=( x.d == 3 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


