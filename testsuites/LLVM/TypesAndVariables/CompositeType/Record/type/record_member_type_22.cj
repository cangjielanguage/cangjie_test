// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


class Data{
    func foo() : Unit {
        print("yes")
    }

}

record Test {
    var a: Unit = Data().foo()
    init(x: Unit) {
        a = x
    }
}

let res = Test(())
let res1 = res.a

func run(): Int64 {
    if (res1 == ()) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
