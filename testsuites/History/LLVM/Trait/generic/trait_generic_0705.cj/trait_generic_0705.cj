// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型trait的This限定于另一个非泛型trait，B101pass
open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

trait Num0 {
    func chooseOne0(a: This, b: Int32): This
}
trait Num1<V> where This<:Num0 {
    func chooseOne1(a: This, b: V): This
}

append<T> Day with Num1<T>  {
    func chooseOne1(a: Day, b: T): Day{
        return a
    }
}
append Day with Num0 {
    func chooseOne0(a: Day, b: Int32): Day{
        return a
    }
}

func run(): Int64 {
    var v0: Day = Day(1)
    var v1: Int32 = 1
    var v2: Day = chooseOne1(v0,v1)
    return 0
}

func main(): Int64 {
     return run()
}

