// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data1 {
    var width: Int32 = 3
}

record Data2<T> {
    let rec: T
    Data2(x: T){
        rec = x
    }
}

func run(): Int64 {
    let data1: Data1 = Data1()
    let data: Data2<Data1> = Data2<Data1>(data1)
    var res: Data1 = data.rec
    if (res.width == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
