// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

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
    let data: Data<DataRec<T>> = Data<DataRec<Int32>>(dataRec)  // EXPECTED: regex undeclared type name 'T'
    var res = data.rec
    if (res.width == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

