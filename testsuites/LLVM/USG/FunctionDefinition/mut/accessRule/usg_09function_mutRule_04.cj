// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check  mutable function to be used as higher-order function
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
    var fn = a.f //EXPECTED: regex mutable function 'f' cannot be used as higher-order function
    return 0
}