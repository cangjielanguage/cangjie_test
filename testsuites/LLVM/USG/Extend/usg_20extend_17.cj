// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {}

extend A {
    func f() {}
}

class B <: A {
    func g() {
        f() // ok
    }
}

func main() {
    let x = B()
    x.f() // ok
    return 0
}