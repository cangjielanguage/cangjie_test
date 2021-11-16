// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func foo(): Int32{ return 2 }

record Test {
    func f(x:()->Int32):()->Int32 { return x}
}


func run(): Int64 {
    let res  = Test().f(foo)
    if (res() == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
