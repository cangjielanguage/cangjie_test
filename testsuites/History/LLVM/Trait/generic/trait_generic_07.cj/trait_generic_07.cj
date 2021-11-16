// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型trait中的类型的层级
open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

record Student<K1> where K1<:Num2_1<K1>  {
    var s: K1
    init(x: K1){
       s = x
    }
}

trait Num0<V> {
    func chooseOne0(a: This, b: V): This
}
trait Num1<V> where This<:Num0<V> {
    func chooseOne1(a: This, b: V): This
}
trait Num2_1<V> where This<:Num0<V>,This<:Num1<V> {
    func chooseOne2_1(a: This, b: V): This
}
trait Num2_2<V> where This<:Num0<V>,This<:Num1<V> {
    func chooseOne2_2(a: This, b: V): This
}

append<U1> Student<U1> with Num2_2<U1> where U1<:Num2_1<U1>   {
    func chooseOne2_2(a: Student<U1>, b: U1): Student<U1> { return a}
}

append<U1> Student<U1> with Num0<U1> where U1<:Num2_1<U1>   {
    func chooseOne0(a: Student<U1>, b: U1): Student<U1> { return a}
}

append<U1> Student<U1> with Num1<U1> where U1<:Num2_1<U1>   {
    func chooseOne1(a: Student<U1>, b: U1): Student<U1> { return a}
}

append<T> Day with Num2_1<T> {
    func chooseOne2_1(a: Day, b: T): Day{
        return a
    }
}


append<T> Day with Num0<T> {
    func chooseOne0(a: Day, b: T): Day{
        return a
    }
}

append<T> Day with Num1<T> {
    func chooseOne1(a: Day, b: T): Day{
        return a
    }
}

func run(): Int64 {
    var v0: Day = Day(1)
    var v1: Student<Day> = Student<Day>(v0)
    let x: Student<Day>  = chooseOne2_2(v1,v0)
    if (x.s.d == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
     return run()
}

