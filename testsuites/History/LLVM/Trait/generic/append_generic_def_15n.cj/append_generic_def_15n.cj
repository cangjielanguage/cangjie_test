// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

trait Num {
    func plus(a: This, b: This): Int32
}

record Student<K>{
    let t: K
    var v: Int32
    init(x:K,y:Int32){
        t = x
        v = y
    }
}

open class Day{}
class Monday <: Day{
    let m: Int32
    init(x: Int32){
        m = x
    }
}

append<U> Student<U> with Num  where U<:Int32 {
    func plus(a: Student<U>, b: Student<U>): Int32 {
        return a.v + b.v
    }
}

func run(): Int64 {
    var i: Monday = Monday(1)
    var j: Monday = Monday(2)
    var a: Student<Monday> = Student<Monday>(i,10)
    var b: Student<Monday> = Student<Monday>(j,20)
    let x: Int32  = plus(a,b) // EXPECTED: regex generics type arguments do not match the constraint
    if (x == 30 && a.t.m == 1 && b.t.m == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


