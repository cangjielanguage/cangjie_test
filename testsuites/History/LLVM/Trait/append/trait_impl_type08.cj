// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: This, b: This): Int32
}

append Range with Num {
    func plus(a: Range, b: Range):Int32 { return 10 }
}

func run(): Int64 {
    var a: Range = 0...10:1 // spec15 Range尚未作为关键字
    var b: Rnage = 0...10:2
    let x: Int32  = plus(a,b)
    if (x==10) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()                               
}