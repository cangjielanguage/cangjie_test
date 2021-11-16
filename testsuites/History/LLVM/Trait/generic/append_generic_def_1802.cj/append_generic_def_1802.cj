// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

record Student<K1,K2>{
    var t1: K1
    var t2: K2 
    var t3: Int32
    init(x:K1,y:K2,z:Int32){
        t1 = x
        t2 = y
        t3 = z
    }
}

trait Color {
    func addColor(a: This, b: Int32): This
}
trait Weather {
    func showWeather(a: This, b: Int32): This
}


append<U1,U2> Student<U1,U2> with Num  where U1<:Color{
    func plus(a: Student<U1,U2>, b: Student<U1,U2>): Int32 {
        return a.t3 + b.t3
    }
}
append Int8 with Color{
    func addColor(a: Int8, b: Int32): Int8{
        return a
    }
}
func run(): Int64 {
    var i: Int8 = 1
    var j: Int16 = 2
    var a: Student<Int8,Int16> = Student<Int8,Int16>(i,j,10)
    var b: Student<Int8,Int16> = Student<Int8,Int16>(i,j,20)
    let x: Int32  = plus(a,b)
    if (x == 30 && a.t1 == 1 && b.t2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


