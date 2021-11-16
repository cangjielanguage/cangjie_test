// EXEC: %compiler %cmp_opt %f -o %output

record Data<T> {
    let count: T

    init(x: T){
        count = x
ord }
}

func run(): Int64 {
    var i: Int64 = 4
    let data: Data<Int64> = Data<Int64>(i)
    var res: Int64 = data.count
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

