// EXEC: %compiler %cmp_opt -c %n.cj -o %output


trait Eq1 {
    func plus(a: This, b: This): This
}

trait Eq2 {
    func time(a: This, b: This): This
}

trait Num where This <: Eq1 , This <: Eq2  {
    func self(a: This): This
}

append Int32 with Eq1 {
    func plus(a: Int32, b: Int32): Int32 { a + b }
}

append Int32 with Eq2 {
    func time(a: Int32, b: Int32): Int32 { a * b }
}

append Int32 with Num {
    func self(a: Int32): Int32 { a + 1 }
}

func run(): Int64 {
    let x : Int32 = plus(1,1)
    let y : Int32 = time(1,2)
    let z : Int32 = self(1)
    if ( x == 2 && y == 2 && z == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

