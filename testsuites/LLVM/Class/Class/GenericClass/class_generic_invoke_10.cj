// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let count: T

    init(x: T){
        count = x
    }
}

func run(): Int64 {
    var getData: ()->Data<Int32> = {  => Data<Int32>(3)}
    var data: Data<Int32> = getData()
    var count: Int32 = data.count
    if (count == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
