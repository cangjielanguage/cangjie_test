// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 泛型trait中的类型限制于自己，且泛型trait的类型变元是append的泛型类型本身，且该泛型类型的类型变元有限定
open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

record Student<K1> where K1<:Num<K1> {
    var s: K1
    init(x: K1){
       s = x
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

append<U1> Student<U1> with Num<Student<U1>> where U1<:Num<U1> {
    func chooseOne(a: Student<U1>, b: Student<U1>): Student<U1> { return a}
}
append<T>  Student<T> with Num<T> where T<:Num<T>{
    func chooseOne(a: Student<T>, b: T): Student<T>{
        return a
    }
}
append<T> Day with Num<T> where T<:Num<T>{
    func chooseOne(a: Day, b: T): Day{
        return a
    }
}


func run(): Int64 {
    var v0: Day = Day(1)
    var v1: Student<Day> = Student<Day>(v0)
    let x: Student<Day>  = chooseOne(v1,v1)
    print("I am y : "+y.toString()+"\n")
    return 1
}

func main(): Int64 {
     return run()
}

