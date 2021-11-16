// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check calling a record mut function (assign to a var)
interface I {
    mut func f(): Int64
}
record Foo <: I {
    var i = 0
    mut func f(): Int64 {
        i += 1
        return i
    }
}

func main() {
    var a = Foo()
    let x = a.f() - 1 
    return x
}