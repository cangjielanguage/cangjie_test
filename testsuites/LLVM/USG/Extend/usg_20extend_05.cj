// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    func f(): Unit
}

class Foo {}

extend Foo <: I {
    func f(): Unit {}
}

func g(i: I) {
    i.f()
}

func main() {
    let a = Foo()
    g(a)
    return 0
}