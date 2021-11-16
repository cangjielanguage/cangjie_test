// EXEC: %compiler %cmp_opt %n.cj -o  %output
// EXEC: %run %run_opt %output %run_args

package pkga

trait Num {
    func self(a: This): This
}

append Int32 with Num {
    func self(a: Int32): Int32 { a + 1 }
}

func run(): Int64 {
    let x: Int32  = self(1)
    if (x == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


