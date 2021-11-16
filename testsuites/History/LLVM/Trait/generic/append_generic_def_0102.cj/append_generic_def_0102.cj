// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

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

append<U> Student<U> with Num{
    func plus(a: Student<U>, b: Student<U>): Int32 {
        return a.v + b.v
    }
}

func run(): Int64 {
    var a: Student<Int32> = Student<Int32>(1,10)
    var b: Student<Int32> = Student<Int32>(2,20)
    let x: Int32  = plus(a,b)
    if (x == 30) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


