// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Data<T> {
    let width: T

    init(x: T){
        width = x
    }
}

func run(): Int64 {
    var MapWidth: Map<Int32, String> = #{1 : "Aa", 2 : "Bb", 3 : "Cc", 1 : "fir"}
    let data: Data<Map<Int32, String>> = Data<Map<Int32, String>>(MapWidth)
    var res = data.width
    if (res == MapWidth) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

