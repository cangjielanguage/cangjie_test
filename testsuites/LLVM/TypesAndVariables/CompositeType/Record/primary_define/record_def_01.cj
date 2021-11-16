// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Int32
    Test(a: Int32){
        this.a = a
    }
}

let res = Test(2).a

func run(): Int64 {

    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
