// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

trait Num<ab> {
    func chooseOne(a: This, b: ab): ab
}

append<U> Int32 with Num<U> {
    func chooseOne(a: Int32, b: U): U { return b }
}

func run(): Int64 {
    let a : Int32 = 1
    let b : Int32 = 2
    let x: Int32  = chooseOne(a,b)
    if (x == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


