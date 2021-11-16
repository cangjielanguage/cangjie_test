// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

record Data<T> {
    let width: T
    let length: T

    Data(x:T, y: T){
        width = x
        length = y
    }

    operator func -(): Data<Int32>{
        var width: Int32 = 3
        var length: Int32 = 4
        Data<Int32>(width, length)
    }
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    var data: Data<Int32> = Data<Int32>(a, b)
    var d1: Data<Int32> = -data
    var res1: Int32 = d1.width
    var res2: Int32 = d1.length
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
