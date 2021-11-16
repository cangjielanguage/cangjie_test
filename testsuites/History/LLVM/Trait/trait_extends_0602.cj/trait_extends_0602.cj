// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Eq1 {
    func plus(a: This, b: This): This
}

trait Eq2 {
    func time(a: This, b: This): This
}

trait Num where This <: Eq1 , This <: Eq2  {
    func self(a: This): This
}

append Int32 with Num {
    func self(a: Int32): Int32 { a + 1 }
}


append Int32 with Eq1 {
    func plus(a: Int32, b: Int32): Int32 { a + b }
}


append Int32 with Eq2 {
    func time(a: Int32, b: Int32): Int32 { a * b }
}



func run(): Int64 {
    let x = plus(1,1)
    let y = time(1,2)
    let z = self(1)
    if ( x == y && y == z) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
