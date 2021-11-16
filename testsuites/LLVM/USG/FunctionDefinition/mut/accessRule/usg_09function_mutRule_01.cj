// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check accessing a mu function in record
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
    let a = Foo()
    a.f() // EXPECTED: regex let instance of record 'a' cannot access the mutable function 'f'
    return 0
}