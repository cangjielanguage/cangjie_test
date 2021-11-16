// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data1 {
    var x: Int32 = 1
    var y: Int32 = 2
}

record Data2<T>{
    var data: T
    Data2(data1: T){
        data = data1
    }
}

func run(): Int64 {
    var res: Int32
    let data1: Data1 = Data1()
    var data2: Data2<Data1> = Data2<Data1>(data1)
    var getData: Data1 = data2.data
    var res1: Int32 = getData.x
    var res2: Int32 = getData.y
    if (res1 == 1 && res2 == 2){
        return 0
    }
    return 1
}
