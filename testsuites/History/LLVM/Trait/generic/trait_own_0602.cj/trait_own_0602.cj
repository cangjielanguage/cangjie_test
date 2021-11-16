// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Student<K1> {
    var s: K1
    init(x: K1){
       s = x
    }
}

trait Num<V> {
    func chooseOne(a: This, b: V): This
}

append<X> X with Num<X> {  // 为所有的类型做了实现，这个合理吗？有了这个， U <: Num<U>的限定，任意类型都满足了
    func chooseOne(a: X, b: X): X { return b}
}

append<U> Student<U> with Num<U> where U <: Num<U> {
    func chooseOne(a: Student<U>, b: U): Student<U> { return a}
}

func run(): Int64 {
    var v0: Int32 = 3
    var v1: Student<Int32> = Student<Int32>(2)
    var v2: Student<Int32> = chooseOne(v1, v0)
    if (v2.s != 2) {
        return 1
    }
    return 0
}

func main(): Int64 {
     return run()
}

