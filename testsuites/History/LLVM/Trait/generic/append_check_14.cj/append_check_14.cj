// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Day{
    var day: Int32
    init(x: Int32){
        day = x
    }
}
class Monday <: Day{
    var d: Int32
    init(x: Int32){
        super(x)
        d = x+1
    }
} 
class Tuesday <: Day{
    var d: Int32
    init(x: Int32){
        super(x)
        d = x+2
    }
} 

trait Num<V1,V2,V3> where V1<:Day,V2<:Day,V3<:Day {
    func chooseOne(a: This, b: V1,c:V2,d:V3): V1
}


record Student {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student with Num<U1,U2,U3> where U1<:Day ,U2<:Day ,U3<:Day{ 
    func chooseOne(a: Student, b:U1, c:U2, d:U3): U1 { return b} 
}


func run(): Int64 {
    var v1: Student = Student(1)
    var v2: Day = Day(2)
    var v3: Monday = Monday(3)
    var v4: Tuesday = Tuesday(4)
    let x: Day = chooseOne(v1,v2,v3,v4)
    if (x.day == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


