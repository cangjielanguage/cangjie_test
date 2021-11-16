// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Foo { 
    let x: Int32 = 3
}

record Test {
    var a: Foo = Foo()
}

let res = Test()
var foo = res.a
let res1 = foo.x

func run(): Int64 {
    if (res1 == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
