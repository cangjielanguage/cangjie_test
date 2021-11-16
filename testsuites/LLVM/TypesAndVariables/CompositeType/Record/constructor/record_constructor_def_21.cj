// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data{
    let width2: Int32 = 1
    let length2: Int32 = 2
    init(a: Int32,b: Int32){
    }
    func area(): Int32 {
        return width2*length2
    }
}

func run(): Int64 {
    var a: Int32 = 5
    var b: Int32 = 6
    let data = Data(a, b)
    var res = data.area()
    if (res == 2) {
        return 0
    }
    return 1
}