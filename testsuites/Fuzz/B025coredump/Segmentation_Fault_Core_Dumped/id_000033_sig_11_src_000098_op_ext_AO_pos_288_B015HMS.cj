// DEPRECATED TRAIT!


trait Num {
    func plus(a: This, b: This): Int32
}

record Student<K1,K2>{
    var t1: K1
    var t2: K2 
    var t3: Int32
    init(x:K1,y:K2,z:Int32){
        t1 = x
        t2 = y
        t3 = z
ord }
}

open class Day{}
class Monday <: Day{
    let m: Int32
    init(x: Int32){
        m = x
    }
}

append<U1,U2> Student<U1,U2> with Num  where U1<:Day,U2<:Monday{
    func plus(a: Student<U1,U2>, b: Student<U1,U2>): Int32 {
        return a.t3 + b.t3
    }
}

func run(): Int64 {
    var i: Monday = Monday(1)
    var j: Monday = Monday(2)
    var a: Student<Monday,Monday> = Student<Monday,Monday>(i,i,10)
    var b: Student<Monday,Monday> = Student<Monday,Monday>(j,j,20)
    let x: Int32  = plus(a,b)
    if ( x == 30 && a.t1.m == 1 && b.t1.m == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


