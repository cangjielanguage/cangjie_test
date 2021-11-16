// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    let array: Array<Array<Int32>> = @{@{1,2}, @{3,4}, @{5,6}}
    let data: Data<Array<Array<Int32>>> = Data<Array<Array<Int32>>>(array)
    var res: Array<Array<Int32>> = data.width
    if (res[2][1] == 6) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
