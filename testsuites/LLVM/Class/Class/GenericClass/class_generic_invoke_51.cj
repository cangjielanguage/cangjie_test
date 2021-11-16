// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    let PIE: T

    init(x: T){
        PIE = x
    }
}

func run(): Int64 {
    var pie: Float64*String = (3.14, "PIE")
    let data: Data<Float64*String> = Data<Float64*String>(pie)
    var res: Float64*String = data.PIE
    if (res[0] == 3.14 && res[1] == "PIE") {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

