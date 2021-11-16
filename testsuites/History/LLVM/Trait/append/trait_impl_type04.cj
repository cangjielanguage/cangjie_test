// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Float64
}

append ListFloat64 with Num {
    func plus(a: ListFloat64, b: ListFloat64):Float64 { return a.get(0)+b.get(0) }
}

func run(): Int64 {
    var a: ListFloat64 = ListFloat64(2,10.0)
    var b: ListFloat64 = ListFloat64(2,20.0)
    let x: Float64  = plus(a,b)
    if (x==30.0) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}