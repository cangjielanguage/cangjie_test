// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check call another function in mut function
record Foo {
    mut func f() {
        let x = g()
        return x
    }
    func g() {
        return 0
    }
}

func main() {
    var a = Foo()
    let x = a.f()
    return x
}