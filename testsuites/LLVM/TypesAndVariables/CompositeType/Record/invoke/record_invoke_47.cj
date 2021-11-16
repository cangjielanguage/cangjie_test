// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var range1 = 0..10:1
    let data: Data<Range<Int64>> = Data<Range<Int64>>(range1)
    var res: Range<Int64> = data.width
    if (res == range1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

