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
    init(){this(1)}
}
class Monday <: Day{
    init(x: Int32){
        d = x+1
    }
} 

append<X1> Student<X1,Day,Day>  with Num{  
    func chooseOne(a: Student<X1,Day,Day>, b: Int32):  Int32 { return b}
}

append<Y1> Student<Y1,Monday,Monday>  with Num { 
    func chooseOne(a: Student<Y1,Monday,Monday>, b: Int32):  Int32 { return b * 2 }
}


func run(): Int64 {
    var v2: Day = Day(2)
    var v3: Monday = Monday(3)
    var a: Student<Int32,Monday,Monday> = Student<Int32,Monday,Monday>(1)
    var v4: Int32 = 4
    let x: Int32  = chooseOne(a,v4)
    if (x == 8) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


