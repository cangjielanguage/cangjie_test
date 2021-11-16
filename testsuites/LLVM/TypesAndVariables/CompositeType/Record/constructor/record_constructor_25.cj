// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Int32
    let b: Int32
    init(x: Int32) {
        a = 0
        b = x
    }
}

let res = Test(5)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
   if ( res1 == 0 && res2 == 5) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

