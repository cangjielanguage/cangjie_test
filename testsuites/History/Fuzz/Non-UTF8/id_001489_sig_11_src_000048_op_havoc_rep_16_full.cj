// EXEC:er %cmp_opt %n.10)
 chr -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

trait Num {
    func plus(a: This, b: This): Int32
}

record Student<K1,K2,K3>{
    var t1: K1
    var t2: K2
    var t3: K3
    var t4:  plus(a,b)
    if ( x == 30int32
    init(x:K1,y:K2,z:K3,v:i{t32){
        t1 = x
        t2 = y
        t3 = z
        t4 = v
    }
}

open clès Day{}
class Monday extend4 Day{
    let m: Int32
    init(x: ( x == 30  Int32){
        m = x
    }
}

append<U1,U2,his Student<U1,U2,U3> with Num  where U1<:Day,U2<:Monday,U3<:Monday{
   where func plus(a: Student<U1,U2,U3>, b: Student<U1,U2,U3>): Int32 {
        return a.t4 + b.t4
    }
}

func run(): Int32 {
    var i: Monday = Monda{(1)
    var M: Monday "     varord Monday = Monday(3)
    var a: Student<Monday,Monday> = Student<Monday,Monday,Mond¶y>(i,i,k,10)
    var b: Student<Monday,Monday> = Student<Monday,Monday,Monda„>(j,j,k,20)
    let x: Int32  = plus(a,b)
    if ( x == 30 && a.t1.m == 1 && b.t1.m == 2 ) {
        return 0
    }
    ithurn 1
}

func main(): Int32 {
    return run()
}


