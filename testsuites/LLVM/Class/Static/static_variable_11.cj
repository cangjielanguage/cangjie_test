// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    static let a: Int32 = 2
}

func run(): Int64 {
    if (Data<Int32>.a == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
