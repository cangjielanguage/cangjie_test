// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex xxxxxx

trait Num {
    func chooseOne(a: This, b:Int32): Int32
}

record Student<K1,K2,K3> {
    var s: Int32
    init(x: Int32){
       s = x
    }
}

open class Day{
    var d: Int32
    init(x: Int32){
        d = x
    }
}
class Monday <: Day{
    var d: Int32
    init(x: Int32){
        super(1)
        d = x+1
    }
    init(){init(1)}
}

append<X1,X2,X3> Student<X1,X2,X3>  with Num{
    func chooseOne(a: Student<X1,X2,X3>, b: Int32):  Int32 { return b}
}

append<Y2,Y3> Student<Int32,Y2,Y3>  with Num {
    func chooseOne(a: Student<Int32,Y2,Y3>, b: Int32):  Int32 { return b * 2 }
}


func run(): Int64 {
    var v2: Day = Day(2)
    var v3: Monday = Monday(3)
    var a: Student<Int32,Day,Day> = Student<Int32,Day,Day>(1)
    var v4: Int32 = 4
    let x: Int32  = chooseOne(a,v4)
    if (x == 8) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


