// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    var a: Int32 = 1
    var b: Int32 = 2
    Test(x: Int32, y: Int32, z: Int32) {
      a = x
      b = y + z
    }
}

let res = Test(5, 6, 7)
let res1 = res.a
let res2 = res.b

func run(): Int64 {
   if ( res1 == 5 && res2 == 13) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

