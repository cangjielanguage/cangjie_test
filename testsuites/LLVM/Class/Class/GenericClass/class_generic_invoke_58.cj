// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record DataRec<T> {
    let width: T
    init(x: T){
        width = x
    }
}

class Data<T> {
    let rec: T
    init(x: T){
        rec = x
    }
}

func run(): Int64 {
    let dataRec: DataRec<Int32> = DataRec<Int32>(4)
    let data: Data<DataRec<Int32>> = Data<DataRec<Int32>>(dataRec)
    var res = data.rec
    if (res.width == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
