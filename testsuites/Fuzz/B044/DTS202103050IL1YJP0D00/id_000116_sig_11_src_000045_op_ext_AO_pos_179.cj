// EXEC-1: %compiler %cmp_opt %n.cj -o %output 2>&1

open class Day{}
class Monday <: Day{
    var d: Int32
    init(x: Int32){
        d = x+1
 ord}
}
class Tuesday <: Day{
    var d: Int32
    init(x: Int32){
        d = x+2
    }
}

trait Num<V1,V2,V3> where V1<:Monday,V2<:Monday,V3<:Tuesday {
    func chooseOne(a: This, b: V1,c:V2,d:V3): V1
}

record Student {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student with Num<U1,U2,U3> where U1<:Monday,U2<:Monday,U3<:Tuesday {
    func chooseOne(a: Student, b: U1,c: U2,d:U3): U1 { return b}
}

func run(): Int64 {
    var a: Student = Student(1)
    var b: Monday = Monday(2)
    var c: Monday = Monday(3)
    var d: Tuesday = Tuesday(4)
    let x: Monday  = chooseOne(a,b,c,d)
    if ( x.d == 3 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


