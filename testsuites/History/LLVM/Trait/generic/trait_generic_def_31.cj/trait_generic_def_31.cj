// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Num<V> {
    func plus(a: This, b: This): Int32
}

append<U> Int32 with Num<U> {
    func plus(a: Int32, b: Int32): Int32 { return a+b }
}

func run(): Int64 {
    var a: Int32 = 1
    var b: Int32 = 2
    let x: Int32  = plus<Int32, Int32>(a,b)
    if (x == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}