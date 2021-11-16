// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型trait的类型变元限定于另一个泛型trait，B101 pass
open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

record Student  {
    var s: Int32
    init(x: Int32){
       s = x
    }
}
trait Num0<V> {
    func chooseOne0(a: This, b: V): This
}
trait Num1<V> where V<:Num0<V>  {
    func chooseOne1(a: This, b: V): This
}
append<T> Day with Num1<T> where T<:Num0<T>  {
    func chooseOne1(a: Day, b: T): Day{
        return a
    }
}
append<T> Day with Num0<T>  {
    func chooseOne0(a: Day, b: T): Day{
        return a
    }
}

func run(): Int64 {
    var v0: Day = Day(1)
    var v2: Day = chooseOne1(v0,v0)
    if (v2.d != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

