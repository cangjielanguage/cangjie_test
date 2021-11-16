// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var record1 : RD<Int32> = RecordData<Int32>(2)
    if ( record1.a != 2 ){
        return 1
    }
    return 0
}

record RecordData<T>{
    var a: T
    init(x: T){
        a = x
    }
}

type RD<T> = RecordData<T>