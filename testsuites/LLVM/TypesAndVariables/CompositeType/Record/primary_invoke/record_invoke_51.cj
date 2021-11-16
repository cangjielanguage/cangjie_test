// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data1<T> {
    let width: T
    Data1(x: T){
        width = x
    }
}

record Data2<T> {
    let rec: T
    Data2(x: T){
        rec = x
    }
}

func run(): Int64 {
    let data1: Data1<Int32> = Data1<Int32>(4)
    let data: Data2<Data1<Int32>> = Data2<Data1<Int32>>(data1)
    var res = data.rec
    if (res.width == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
