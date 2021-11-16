// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Monday {
    let m: Int32
    init(x: Int32){
        m = x
    }
}

trait Num<V1,V2,V3> {
    func chooseOne(a: This, b: V1,c:V2): V1
}

append<U1,U2,U3> Int32 with Num<U1,U2,U3> {
    func chooseOne(a: Int32, b: U1,c: U2): U1 { return b }
}

func run(): Int64 {
    var a: Int32 = 1
    var b: Monday = Monday(2)
    var c: Monday = Monday(3)
    let x: Monday  = chooseOne<Int32, Monday, Monday, Monday>(a,b,c)
    if (x.m == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


