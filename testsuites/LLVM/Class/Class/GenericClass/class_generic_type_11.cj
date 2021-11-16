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

func run(data: Data<Int32>): Int64 {
    let res1 = data.x
    let res2 = data.y
    if (res1 == 3 && res2 ==4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    let data: Data<Int32> = Data<Int32>(3, 4)
    return run(data)
}
