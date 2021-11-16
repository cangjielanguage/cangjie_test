// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    func f(): Unit {}
}

interface I {
    func f(): Unit
}

extend Foo <: I {}

func main() {
    Foo().f()
    return 0
}