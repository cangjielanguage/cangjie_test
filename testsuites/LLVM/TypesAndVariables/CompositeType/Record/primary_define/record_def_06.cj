// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a1: Int32 = 1

    Test(a: Int32){
        a1 = a
    }
}

let res = Test(2).a1

func run(): Int64 {
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
