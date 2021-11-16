// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    mut func f(): Unit
}

record Foo <: I {
    var i = 0
    mut func f(): Unit {
        i += 1
    }
}

func main() {
    var a = Foo()
    var b: I = Foo()
    var fn = b.f // ok
}


