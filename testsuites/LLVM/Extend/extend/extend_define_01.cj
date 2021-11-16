// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Int32 {
    func plus(a: Int32): Int32 { this + a }
}

func run(): Int64 {
    let x: Int32  = Int32(2).plus(1)
    if (x == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}