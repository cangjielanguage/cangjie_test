// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    var a: () -> Int32= {  => 4}
    var b: () -> Int32 = a
    Data(a: () -> Int32, b: () -> Int32) {}
}

func run(): Int64 {
    var a: () -> Int32 = {  => 3}
    var b: () -> Int32 = {  => 4}
    let data = Data(a, b)
    let res1 = data.a()
    let res2 = data.a()
    if (res1 == res2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

