// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b:Int32): Int32
}

record Student<K1,K2,K3> {
    var s: Int32
    init(x: Int32){
       s = x
    }
}

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

append<V1,V2,V3> Student<V1,V2,V3>  with Num{  
    func chooseOne(a: Student<V1,V2,V3>, b: Int32):  Int32 { return b}
}

func run(): Int64 {
    var v1: Day = Day(1)
    var v2: Monday = Monday(2)
    var v3: Student<Int32,Day,Day> = Student<Int32,Day,Day>(1)
    var v4: Int32 = 4
    let x: Int32  = chooseOne(v3,v4)
    if (x == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


