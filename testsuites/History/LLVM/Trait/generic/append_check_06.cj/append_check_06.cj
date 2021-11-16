// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

trait Num {
    func chooseOne(a: This, b: Int32): This
}

record Student<K1> {
    var s: K1
    init(x: K1){
       s = x
    }
}

append<U1> Student<U1> with Num where U1<:Num  { 
    func chooseOne(a: Student<U1>, b: Int32): Student<U1> { return a}
}

append Day with Num {
    func chooseOne(a: Day, b: Int32): Day{
        return a
    }
}

func run(): Int64 {
    var v0: Day = Day(1)
    var v1: Student<Day> = Student<Day>(v0)
    var v2: Int32 = 2
    let x: Student<Day>  = chooseOne(v1,v2)
    if (x.s.d == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


