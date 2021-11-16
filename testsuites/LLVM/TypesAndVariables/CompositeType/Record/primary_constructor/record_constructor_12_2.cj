// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test {
    let a: Int32
    let b: Int32
    Test(x:Int32,y: Int32, z: Int32) {
        a = x+1
        b = y+1
    }
}

let res = Test(10, 20, 60)

func run(): Int64 {
    let width = res.a
    let length = res.b
    if (width == 11 && length == 21) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

