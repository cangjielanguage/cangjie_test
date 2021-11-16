// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

record Data {
    func area<T>(width: T): T {
        return width
    }
}

func run(): Int64 {
    var width: Int32 = 2
    let data: Data = Data()
    var res: Int32 = data.area<Int32>(width)
    if (res == 2) {
        return 0
    } 
    return 1 
}

