//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Foo {
    let x: Int32 = 3 // EXPECTED:regex error.*?variable 'x' can not be declared in interface
}

class Loo <: Foo {
    let y: Int32 = 4
}

record Test {
    let a: Foo = Loo()
}

func run(): Int64 {
    var res = Test().a.y
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
