// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args




trait Color{
    func addPink(a:This,b:This):Int32
}
class Monday {
    let m: Int32
    init(x: Int32){
        m = x
    }
} 
append Monday with Color{
    func addPink(a:Monday,b:Monday):Int32{
        return a.m+b.m
    }   
}

trait Num {
    func plus(a: This, b: This): Int32
}
record Student<K>{
    var t: K 
    var v: Int32
    init(x:K,y:Int32){
        t = x
        v = y
    }
}
append<U> Student<U> with Num where U<:Color {
    func plus(a: Student<U>, b: Student<U>): Int32 {
        return a.v + b.v
    }
}

func run(): Int64 {
    var i: Monday = Monday(1)
    var j: Monday = Monday(2)
    var a: Student<Monday> = Student<Monday>(i,10)
    var b: Student<Monday> = Student<Monday>(j,20)
    let x: Int32  = plus(a,b)
    if (x == 30 && a.t.m == 1 && b.t.m == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


