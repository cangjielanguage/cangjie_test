// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

record Student<K1,K2,K3>{
    var t1: K1
    var t2: K2
    var t3: K3
    var t4: Int32
    init(x:K1,y:K2,z:K3,v:Int32){
        t1 = x
        t2 = y
        t3 = z
        t4 = v
    }
}

open class Day{}
class Monday <: Day{
    let m: Int32
    init(x: Int32){
        m = x
    }
}

append<U1,U2,U3> Student<U1,U2,U3> with Num  where U1<:Day,U2<:Monday,U3<:Monday{
    func plus(a: Student<U1,U2,U3>, b: Student<U1,U2,U3>): Int32 {
        return a.t4 + b.t4
    }
}

func run(): Int64 {
    var i: Monday = Monday(1)
    var j: Monday = Monday(2)
    var k: Monday = Monday(3)
    var a: Student<Monday,Monday,Monday> = Student<Monday,Monday,Monday>(i,i,k,10)
    var b: Student<Monday,Monday,Monday> = Student<Monday,Monday,Monday>(j,j,k,20)
    let x: Int32  = plus(a,b)
    if (x == 30 && a.t1.m == 1 && b.t1.m == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


