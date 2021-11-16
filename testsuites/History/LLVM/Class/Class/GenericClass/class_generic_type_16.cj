// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    var x: T
    var y: T
    init(a: T, b: T){
        x = a
        y = b
    }
}

interface I {
    let data: Data<Int32> = Data<Int32>(3, 4)
}

func main(): Int64 {
    var data: Data<Int32> = I.data
    var res1: Int32 = data.x
    var res2: Int32 = data.y
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
