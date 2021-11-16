// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    Test(let a: Int32, let b: Int32) {}
}

let res = Test(5, 6)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
   if ( res1 == 5 && res2 == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

