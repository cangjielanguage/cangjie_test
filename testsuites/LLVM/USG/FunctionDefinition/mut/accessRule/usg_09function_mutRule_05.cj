// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

// check mut func assigned to a variable and call it
interface I {
    mut func f(): Unit
}
record Foo <: I {
    var v = 0
    mut func f(): Unit {
        v += 1
    }
}
func main() {
    var a = Foo()
    var b: I = a
    b.f()
    return a.v
}