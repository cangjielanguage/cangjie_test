// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Array<Int32> = @{1,3}
}

let res = Test()
let res1 = res.a

func run(): Int64 {
    if (res1[0] == 1 && res1[1] == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
