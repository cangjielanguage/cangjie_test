// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

trait Num<V> {
    func chooseOne(a: This, b: V): This
}

record Student<K1> {
    var s: K1
    init(x: K1){
       s = x
    }
}
record Teacher<K1> where K1<:Num<K1> {
    var t: K1
    init(x: K1){
       t = x
    }
}

append<U1> Student<U1> with Num<Teacher<U1>> where U1<:Num<U1> {
    func chooseOne(a: Student<U1>, b: Teacher<U1>): Student<U1> { return a}
}
append<T> Day with Num<T> {
    func chooseOne(a: Day, b: T): Day{
        return a
    }
}

func run(): Int64 {
    var v0: Day = Day(1)
    var v1: Student<Day> = Student<Day>(v0)
    var v2: Int32 = 2
    var v3: Teacher<Day> = Teacher<Day>(v0)
    let x: Student<Day>  = chooseOne(v1,v3)
    if (x.s.d == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
     return run()
}


