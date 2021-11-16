// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    let a: Int32 = 1
    let b: Int32 = a
    init(x: Int32, y: Int32){
    }

}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data = Data(a, b)
    let res1 = data.a
    let res2 = data.b
    if (res1 == res2 && res1 == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}


