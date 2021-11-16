// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let count: T

    init(x: T){
        count = x
    }
}

trait Add {
    func add(operand: This): This
}

append Data<Int32> with Add {
    func add(operand: Data<Int32>): Data<Int32>{
        var data: Data<Int32> = Data<Int32>(operand.count+1)
        return data
    }
}


func run(): Int64 {
    var data1: Data<Int32> = Data<Int32>(3)
    var data2 = data1.add()
    let res: Int32 = data2.count
    if ( res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
