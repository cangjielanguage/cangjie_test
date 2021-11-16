// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func chooseOne(a: This, b: Int32): Int32
}

append<U1> Range<U1> with Num{
    func chooseOne(a: Range<U1>, b: Int32): Int32 {
        return b
    }
}

func run(): Int64 {
    var a: Range<Int32> = 0...10:1 // spec15 Range尚未作为关键字
    var b: Int32 = 2
    let x: Int32  = chooseOne(a,b)
    if (x == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


