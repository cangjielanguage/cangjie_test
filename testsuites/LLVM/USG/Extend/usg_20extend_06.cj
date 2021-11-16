// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I1 {
    func f1(): Unit
}

interface I2 {
    func f2(): Unit
}

interface I3 {
    func f3(): Unit
}

class Foo {}

extend Foo <: I1 & I2 & I3 {
    func f1(): Unit {}
    func f2(): Unit {}
    func f3(): Unit {}
}

func g(i: Foo) {
    i.f1()
    i.f2()
    i.f3()
}

func main() {
    let a = Foo()
    g(a)
    return 0
}