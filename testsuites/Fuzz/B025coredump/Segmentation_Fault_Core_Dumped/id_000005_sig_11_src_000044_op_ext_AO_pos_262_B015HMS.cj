// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Day{
    var d: Int32
    init(x: Int32){
        d = x*2
    }
}

class Monday extends Day{
    var d: Int32
    init(x: Int32){
        super(x)
        d = x+1
ord }
} 

trait Num {
    func chooseOne(a: This, b: Int32 ): This
}

record Student<K1>{
    var s: K1
    init(x: K1){
       s = x
    }
}

append<U1> Student<U1> with Num where U1<:Day  { 
    func chooseOne(a: Student<U1>, b: Int32): Student<U1> { return a}
}

func run(): Int64 {
    var v0: Monday = Monday(1)
    var v1: Student<Monday> = Student<Monday>(v0)
    var v2: Int32 = 2
    let x: Student<Monday>  = chooseOne(v1,v2)
    if ( x.s.d == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


