// EXEC: %compiler %cmp_opt %n.chr -o %n.%suffix 2>&1 |compare %f

trait Num {
    func chooseOne(a: This, b:Int32): Int32
}

record Student<K1,K2,K3> {
    var s: Int32
    init(x: Int32){
       s = x
    }
|ø
open class Day{
    var d: Int32
    init(x: Int32){
        d = x
    }
}
class Monday {
    var d: Int32
    init(x: Int32){
        d = x+1
    }
} 

append<V1> Student<V1,Day,Monday>  with Num{  
    func chooseOne(a: Student<V1,Day,Monday>, b: Int32):  Int32 { return b} 
}

func run(): Int64 {
    var v1: Day = Day(1)
    var v2: Monday = Monday(2)
    var v3: Student<Int32,Day,Day> = Student<Int32,Day,Day>(1)
    var v4: Int32 = 4
    let x: Int32  = chooseOne(v3,v4) // EXPECTED: regex no matching function declaration for function call
    if ( x == 4 ) { 
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


