// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let width: T

    Data(x: T){
        width = x
    }
}

func run(): Int64 {
    let array: Array<Int32> = @{1,2}
    let data: Data<Array<Int32>> = Data<Array<Int32>>(array)
    var res = data.width
    if (res[1] == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

