// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data {
    var x: Int32 = 1
    var y: Int32 = 2
    init(a: Int32, b:Int32){
        x = a
        y = b
    }
}

trait Add {
    func add(operand: This): This
}

append Data with Add {
    func add(operand: Data): Data{
        var data: Data = Data(operand.x+1, operand.y+1)
        return data
    }
}


func run(): Int64 {
    var data1: Data = Data(3, 1)
    var data2 = data1.add()
    let res1: Int32 = data2.x
    let res2: Int32 = data2.y
    if (res1 == 4 && res2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
