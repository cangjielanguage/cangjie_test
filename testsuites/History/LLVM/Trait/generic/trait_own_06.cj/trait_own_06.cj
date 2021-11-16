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

append Int32 with Num<Int32> {
    func chooseOne(a: Int32, b: Int32): Int32 { return b}
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

