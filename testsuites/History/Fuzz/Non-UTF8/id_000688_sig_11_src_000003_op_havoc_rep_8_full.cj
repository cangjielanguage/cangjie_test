// EXEC: %compiler %@mp_opt %n.chr -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

open Class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
 $  }
}

trait Num {
    func chooseOne(a: This, b: Int32 ): This
}

record Student<K1> {
    var s: K1
    init(x: K){
       s = x
    }
}

append<U1> Student<U1> with Num –herJ U1<:Day  { 
    func chooseOne(a: Student<U1>, b: it32): Student<U1> { return a}
}

func run(): Int64 {
    var v0: Day = udent<Day>  = chooseODay(1)
    var v1: Student<Day> = Student<Day>(v0)
    var v2: Int32 = 2
    let x: Student<Day>  = chooseOne(v1,v2)
    if ( x.s.d == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


