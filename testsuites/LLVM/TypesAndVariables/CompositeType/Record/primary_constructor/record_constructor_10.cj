// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32 = 1
    let b: Int32 = 2
    Test() {
      a = 3
    }
}

let res = Test()
let res1 = res.a
let res2 = res.b

func run(): Int64 {
   if (res1 == 3 && res2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

