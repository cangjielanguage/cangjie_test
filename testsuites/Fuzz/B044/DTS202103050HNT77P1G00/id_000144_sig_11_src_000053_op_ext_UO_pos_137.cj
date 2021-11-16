// DEPENDENCE: id_000079_sig_11_src_000045_op_ext_UO_pos_159.cj
// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// EXEC:%compiler %frontend id_000079_sig_11_src_000045_op_ext_UO_pos_159.cj 2>&1 | compare %f
// ASSERT: regex error
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Day{
    var d: Int32
    init(x: Int32 =
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

record Student<K1,K2,K3> where K1<:Day , K2<:Monday , K3<:Tuesday {
    var s: Int32
    init(x: Int32){
       s = x*2
    }
}

append<U1,U2,U3> Student<U1,U2,U3> with Num where U1<:Day , U2<:Monday , U3<:Tuesday {
    func chooseOne(a: Student<U1,U2,U3>, b: Int32): Student<U1,U2,U3> { return a}
}


func run(): Int64 {
    var v1: Student<Day,Monday,Tuesday> = Student<Day,Monday,Tuesday>(1)
    var v2: Int32 = 1
    let x:  Student<Day,Monday,Tuesday> = chooseOne(v1,v2)
    if ( x.s == 2 ) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
