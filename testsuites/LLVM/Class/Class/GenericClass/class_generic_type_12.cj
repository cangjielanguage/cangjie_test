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

func foo(x: Int32, y: Int32): Data<Int32> {
    var data: Data<Int32> = Data<Int32>(x, y)
    return data
}

func main(): Int64 {
    let data: Data<Int32> = foo(3, 4)
    let res1: Int32 = data.x
    let res2: Int32 = data.y
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}
