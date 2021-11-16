// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data {
    static func area(): Int32 {
        return 2
    }
}

func run(): Int64 {
    var area: Int32 = Data.area()
    if (area == 2){
        return 0
    }
    return 1
}