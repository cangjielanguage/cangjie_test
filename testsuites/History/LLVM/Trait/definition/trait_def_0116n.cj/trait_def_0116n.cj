// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func plus(a: Int32): This
}
append Int32 with Num {
    func plus(a: Int32): Int32 { a + a }
}

func run(): Int64 {
    var a:Int32 = 2
    let x: Int32  = plus(a)
    if (x == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
