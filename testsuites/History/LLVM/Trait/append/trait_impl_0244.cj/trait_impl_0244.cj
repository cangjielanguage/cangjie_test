// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num {
    func five(a: This, b: This, c: This, d: This, e: This): This
}

append Int32 with Num {
    func five(a: Int32, b: Int32, c: Int32, d: Int32, e: Int32): Int32{ e }
}

func run(): Int64 {
    let x: Int32  = five(1,2,3,4,5)

    if (x == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}