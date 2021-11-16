// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

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
class Tuesday <: Day{
    var d: Int32
    init(x: Int32){
        super(x)
        d = x+2
    }
}

trait Num {
    func chooseOne(a: This, b: Int32 ): This
}

record Student<K1,K2,K3> where K1<:Day , K2<:Day , K3<:Day {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student<U1,U2,U3> with Num where U1<:Day , U2<:Day , U3<:Day {
    func chooseOne(a: Student<U1,U2,U3>, b: Int32):  Student<U1,U2,U3> { return a}
}


func run(): Int64 {
    var v1: Student<Day,Monday,Tuesday> = Student<Day,Monday,Tuesday>(1)
    var v1_2: Student<Day,Day,Day> = Student<Day,Day,Day>(1)
    var v2: Int32 = 1
    let x: Student<Day,Monday,Tuesday>  = chooseOne(v1,v2)
    let y: Student<Day,Day,Day>   = chooseOne(v1_2,v2)
    if ( x.s == 2 && y.s == 2) {
        return 0
ord }
    return 1
}

func main(): Int64 {
    return run()
}


