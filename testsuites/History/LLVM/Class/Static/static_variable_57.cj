// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    let a: Int32 = 2
    let b: Int32 = a + 1
}

func run(): Int64 {
    if (I.a == 2 && I.b == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
