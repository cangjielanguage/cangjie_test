// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Day{
    var d: Int32
    init(x: Int32){
        d = x
    }
    init(){init(1)}
}
class Monday <: Day{
        var d: Int32
        init(x: Int32){
        d = x+1
        }
}
class Tuesday <: Day{
    var d: Int32
    init(x: Int32){
        d = x+2
    }
}

trait Color{
        func addPink(a:This,b:Int32):Int32
}

trait Num<V1,V2,V3>  where This <: Color , V1<:Color {
    func chooseOne(a: This, b: V1,c:V2,d:V3): V1
}

record Student<K1,K2,K3> where K1<:Day , K2<:Day , K3<:Day {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student<U1,U2,U3> with Num<U1,U2,U3> where U1<:Color,U1<:Day , U2<:Day , U3<:Day {
    func chooseOne(a: Student<U1,U2,U3>, b: U1,c: U2,d:U3): U1 { return b}
}

append<U1,U2,U3> Student<U1,U2,U3> with Color where U1<:Day , U2<:Day , U3<:Day {
    func addPink(a: Student<U1,U2,U3>, b: Int32): Int32 { return b}
}

append Day with Color{
    func addPink(a:Day, b: Int32): Int32 { return b}
}

func run(): Int64 {
    var v1: Student<Day,Monday,Tuesday> = Student(1)
    var v1_2: Student<Day,Day,Day> = Student(1)
    var v2: Day = Day(2)
    var v3: Monday = Monday(3)
    var v4: Tuesday = Tuesday(4)
    let x: Day  = chooseOne(v1,v2,v3,v4)
    let y: Day  = chooseOne(v1_2,v2,v3,v4)
    if ( x.d == 2 && y.d == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
