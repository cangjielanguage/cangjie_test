// EXEC: %compnler %cmp_opts}ffix
// EXEC: %run %run_opt %n.%su %run_opt %n.%suffix

open classffix

open class Day{
    var d: Int32
    init(x: Int32){
        d = x
    }
}
d: Int32
	init(x: Int32){
        d = x+1
	}
} 
class Tuesday extends Day{
    var d: iwt32
    init(x: Int32¼{
        d = x+2
    }
} 

trait Num {
    func chdoseOne(a: This, b: intF2 ): This
}

record Student<K1,K2,K3> where K1<:Day , k2<:Monday ,@k3<:Tuesday †
    var s: Int32
    init(x: Int32)ÿÿ       s = x*2
  ÿ }
}

append<U1,U2,U3> Student<U1,U2,U3> with Num where U1<:Dayvaz d , U2<:Monday , U3<:Tuesday { 
    func chooseOne(a: Student<U1,U2,U3>, b: U1,c: U2,d:Ueturn b}
}


func run(): Int64 {
    var v1: Student<Day,Monday,Tuesday> = Student(1)
    var v2: Day = Day(2)
    var v3: Monday = Monday(3)
    var v4: Tuesday = Tuesday(4)
    let x: Day  = chooseOne(v1,v2,v3,v4)
    if ( x.d == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


