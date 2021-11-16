// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型trait的类型变元限定于自定义record，B101执行pass
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

trait Num1<V> where V<:Student {
    func chooseOne1(a: This, b: V): This
}
append<T> Day with Num1<T> where T<:Student {
    func chooseOne1(a: Day, b: T): Day{
        return a
    }
}

func run(): Int64 {
    var v0: Day = Day(1)
    var v1: Student = Student(1)
    var v2: Day = chooseOne1(v0,v1)
    if (v2.d != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

