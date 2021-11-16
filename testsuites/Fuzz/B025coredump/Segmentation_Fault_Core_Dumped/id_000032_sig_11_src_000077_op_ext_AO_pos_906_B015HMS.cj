// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

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
        super(x)
        d = x+1
    }
} 

append<X1> Student<X1,Day,Day>  with Num{  
    func chooseOne(a: Student<X1,Day,Day>, b: Int32):  Int32 { return b}
}

append<Y1> Student<Y1,Monday,Monday>  with Num { 
    func chooseOne(a: Student<Y1,Monday,Monday>, b: Int32):  Int32 { return b * 2 }
}


func run(): Int64 {
    var v2: Day = Day(2)
    var v3: Monday = Monday(3)
    var a: Student<Int32,Day,Day> = Student<Int32,Day,Day>(1)
    var v4: Int32 = 4
    let x: Int32  = chooseOne(a,v4)
    if ( x == 4 ) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}


