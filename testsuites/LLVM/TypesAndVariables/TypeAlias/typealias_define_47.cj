// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record RecordData<T> {
    var a: T
    init(x: T){
        a = x
    }
}

type RD<T> = RecordData<T>

func main(): Int64 {
    var record1: RD<Int32> = RecordData<Int32>(2)
    var record2: RecordData<Int32> = RecordData<Int32>(2)
    if (record1.a == record2.a) {
        return 0
    }
    return 1
}