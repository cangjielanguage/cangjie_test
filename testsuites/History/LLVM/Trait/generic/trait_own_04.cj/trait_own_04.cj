// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// Trait的类型变元限定于本身Trait
class Day {
    var d: Int32
    init(x: Int32){
        d = x
    }
}

record Student<K1> where K1<: Num<K1>  {
    var s: K1
    init(x: K1){
       s = x
    }
}

trait Num<V> where V <: Num<V>{
    func chooseOne(a: This, b: V): This
}

append<U1> Student<U1> with Num<U1> where U1 <: Num<U1> {
    func chooseOne(a: Student<U1>, b: U1): Student<U1> { return a}
}

append<U1> U1 with Num<U1> { // 这一行是为了满足 V <: Num<V>，但是这个写法合理吗？同用例trait_own_0602.cj
    func chooseOne(a: U1, b: U1): U1 { return a}
}

func run(): Int64 {
    var v0: Int32 = 1
    var v1: Day  = Day(1)
    var v2: Student<Day> = Student<Day>(v1)
    var v3: Student<Day> = chooseOne(v2,v1)
    if (v3.s.d != 1) {
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

