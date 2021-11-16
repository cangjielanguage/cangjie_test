//EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface Foo { 
    let x: Int32 = 3 // EXPECTED:regex error.*? variable 'x' can not be declared in interface
}

class Loo <: Foo {
    let y: Int32 = 4
}

record Test {
    func f(x: Foo): Foo { return x}
}

let res = Test()
let foo = res.f(Loo())
let res1 = foo.y

func run(): Int64 {
    if (res1 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
