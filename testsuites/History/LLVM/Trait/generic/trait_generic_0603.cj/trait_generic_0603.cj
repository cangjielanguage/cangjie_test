// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

//  泛型trait中的类型变元限定为自身trait，append时泛型trait的类型变元是append的类型本身（泛型）
open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

record BadStudent<K1>  {
    var s: K1
    init(x: K1){
       s = x
    }
}

trait Num<V> where V<:Num<V> {
    func chooseOne(a: This, b: V): This
}

append<U1> BadStudent<U1> with Num<BadStudent<U1>>  {
    func chooseOne(a: BadStudent<U1>, b: BadStudent<U1>): BadStudent<U1> { return a}
}

func run(): Int64 {
   var v0: Day = Day(1)
   var v1: BadStudent<Day> = BadStudent<Day>(v0)
   let x: BadStudent<Day>  = chooseOne(v1,v1)
    if (x.s.d != 2){
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

