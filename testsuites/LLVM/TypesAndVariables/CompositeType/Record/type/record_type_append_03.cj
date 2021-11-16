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

interface Add<T> {
    operator func + (right: T): T
}

extend Data <: Add<Data> {
    operator func + (right: Data): Data{
        Data(this.x+right.x, this.y+right.y)
    }
}


func run(): Int64 {
    var data1: Data = Data(3, 2)
    var data2: Data = Data(3, 2)
    var data3 = data1 + data2
    let res1: Int32 = data3.x
    let res2: Int32 = data3.y
    if (res1 == 6 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
