// EXEC: %compiler %cmp_opt  %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


trait Num {
    func plus(a: Int32, b: Int32): This
}

append Int32 with Num {
    func plus(a: Int32,b:Int32): Int32 { a + b }
}

func run(): Int64 {
    let x: Int32  = plus(1,2)
    if (x == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

